data "terraform_remote_state" "vault" {
  backend = "s3"
  config = {
    bucket = var.remote_state.bucket
    key    = var.remote_state.key
    region = var.remote_state.region
  }
}

output "path" {
  value = data.terraform_remote_state.vault.outputs.mount
}



