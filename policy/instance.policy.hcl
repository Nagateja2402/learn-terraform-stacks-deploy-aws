policy {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0, < 7.0.0"
    }
  }
}

input "enforcement_level" {
  type = string
  default = "advisory"
  sensitive = true
}

resource_policy "aws_instance" "instance_type_validation" {
  enforcement_level = input.enforcement_level
    locals {
        instance_type = core::try(attrs.instance_type, "")
    }
    enforce {
        condition = local.instance_type != "" && local.instance_type != "t2.micro"
        error_message = "Instance type must be specified and should not be t2.micro"
        info_message = "Instance type is valid: ${local.instance_type}, enforcement_level: ${input.enforcement_level}"
    }
}

resource_policy "aws_instance" "vpc_validation" {
    enforcement_level = input.enforcement_level

  locals {
    # Get the subnet ID from the instance
    subnet_id = core::try(attrs.subnet_id, "")
  }

  enforce {
    condition     = local.subnet_id == ""
    info_message  = "EC2 instance is deployed in a valid VPC with subnet value ${local.subnet_id}"
    error_message = "EC2 instance's subnet does not belong to a defined VPC"
  }
}

resource_policy "aws_s3_bucket" "bucket_name_validation" {
  enforcement_level = input.enforcement_level
  filter = meta.tfe_stack.deployment_name == "development"
  locals {
    bucket_name = core::try(attrs.bucket, "")
  }

  enforce {
    condition     = local.bucket_name != "" && local.bucket_name == "test-bucket-naga-stacks-2402" && input.enforcement_level == "advisory"
  }
  enforce {
    condition = attrs.force_destroy == false
  }
}

module_policy "*" "vpc_source_validation" {
  enforcement_level = input.enforcement_level
  enforce {
    condition     = input.enforcement_level == "advisory"
    error_message = "VPC name must be specified in the module"
    info_message  = "VPC name is valid: ${meta.source}, address: ${meta.address}"
  }

  enforce {
    condition = core::contains(["module.load_random", "module.vpc"], meta.address)
  }
}

provider_policy "aws" "aws_policy" {
  enforcement_level = input.enforcement_level
  enforce {
    condition = input.enforcement_level == "advisory"
  }

  enforce {
    condition = meta.name == "azure"
  }
}

resource_policy "aws_dax_cluster" "not-exist" {
  enforce {
    condition = attrs.cluster_name == "new_cluster"
  }
}
