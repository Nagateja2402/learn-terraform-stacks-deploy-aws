# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "regions" {
  description = "AWS regions to deploy to."
  type        = set(string)
}

variable "identity_token" {
  description = "Identity token for authentication."
  type        = string
  ephemeral   = true
}

variable "role_arn" {
  description = "ARN of role associated with identity token."
  type        = string
}

variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default = {
    Stack       = "learn-stacks-deploy-aws",
    Environment = "dev"
  }
}

variable "bucket-name" {
  type = string
  default = "test-bucket-naga-stacks-240212"
}
