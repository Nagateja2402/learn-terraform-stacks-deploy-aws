# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "vpc" {
  source   = "./vpc"
  for_each = var.regions

  inputs = {
    vpc_name = "stacks-${each.value}-${var.default_tags.Environment}"
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}

component "instance" {
  source   = "./instance"
  for_each = var.regions

  inputs = {
    network = {
      vpc_id             = component.vpc[each.value].vpc_id
      private_subnet_ids = component.vpc[each.value].private_subnet_ids
      security_group_ids = [component.vpc[each.value].security_group_id_ssh]
    }

    key_name = component.key_pair[each.value].key_name
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}

component "key_pair" {
  source   = "./key_pair"
  for_each = var.regions

  providers = {
    aws = provider.aws.this[each.value]
    tls = provider.tls.this
  }
}

component "s3" {
  source   = "./s3"
  for_each = var.regions

  inputs = {
    bucket-name = var.bucket-name
  }

  providers = {
    aws = provider.aws.this[each.value]
  }
}

component "random" {
  source = "./module_random"
  for_each = var.regions

  providers = {
    random = provider.random.this
  }
  
}
