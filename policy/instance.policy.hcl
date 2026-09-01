policy {

}

resource_policy "aws_instance" "instance_type_validation" {
  enforcement_level = "advisory"
    locals {
        instance_type = core::try(attrs.instance_type, "")
    }
    enforce {
        condition = local.instance_type != "" && local.instance_type != "t2.micro"
        error_message = "Instance type must be specified and should not be t2.micro"
        info_message = "Instance type is valid: ${local.instance_type}"
    }
}

resource_policy "aws_instance" "vpc_validation" {
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
  enforcement_level = "advisory"
  locals {
    bucket_name = core::try(attrs.bucket, "")
  }

  enforce {
    condition     = local.bucket_name != "" && local.bucket_name == "archana-tfpolicy-stack-202604270235"
    error_message = "S3 bucket name must be specified and should be archana-tfpolicy-stack-202604270235"
    info_message  = "S3 bucket name is valid: ${local.bucket_name}"
  }
}

module_policy "./vpc" "vpc_source_validation" {
  enforce {
    condition     = core::try(attrs.source, "") != "terraform-aws-modules/vpc/aws"
    error_message = "VPC name must be specified in the module"
    info_message  = "VPC name is valid: ${attrs.source}"
  }
}

provider_policy "aws" "aws_provider_policy" {

  enforce {
    condition     = core::semverconstraint(core::try(attrs.version, ""), "~> 6.14.1")
    error_message = "Allowed providers in this setup evaluation must be aws and tls with versions ~> 6.14.1"
  }
}