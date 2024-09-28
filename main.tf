data "terraform_remote_state" "vault" {
  backend = "s3"
  config = {
    bucket = var.remote_state.bucket
    key    = var.remote_state.key
    region = var.remote_state.region
  }
}

data "vault_aws_access_credentials" "creds" {
  backend = data.terraform_remote_state.vault.outputs.backend
  role    = data.terraform_remote_state.vault.outputs.role
}

output "aws" {
  sensitive = true
  value = {
    access_key = data.vault_aws_access_credentials.creds.access_key
    secret_key = data.vault_aws_access_credentials.creds.secret_key
  }
}



