variable "remote_state" {
  description = "Configuration of the S3 bucket where we will pull remote state."
  type = object({
    bucket = optional(string)
    key    = optional(string, "terraform/stacks/by-id/bucket/terraform.tfstate")
    region = optional(string, "eu-west-1")
  })
  default = {}
}
