input "enforcement_level" {
  type = string
  default = "advisory"
  sensitive = true
}

input "tags" {
  type = string
  default = "{\"Environment\":\"dev\",\"Owner\":\"platform-team\",\"CostCenter\":\"engineering\"}"

}