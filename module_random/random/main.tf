terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

resource "random_string" "random" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_pet" "one" {
  keepers = {
    stable = "v1"
  }
  length = 4
}

resource "random_pet" "two" {
  keepers = {
    stable = "v1"
  }
  length = 4
}

resource "random_pet" "three" {
  keepers = {
    stable = "v1"
  }
  length = 4
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!@#$%"
}

resource "random_integer" "priority" {
  min = 1
  max = 100
}

resource "random_string" "suffix" {
  length  = 8
  upper   = false
  special = false
}

resource "random_string" "random1" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random2" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random3" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random4" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random5" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random6" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random7" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random8" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random9" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random10" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random11" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random12" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random13" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random14" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random15" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random16" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random17" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random18" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random19" {
  length           = 14
  special          = true
  override_special = "/@£$"
}

resource "random_string" "random20" {
  length           = 14
  special          = true
  override_special = "/@£$"
}