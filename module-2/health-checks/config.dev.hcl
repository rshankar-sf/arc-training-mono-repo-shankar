region         = "us-east-1"
key            = "health-checks/terraform.tfstate"
bucket         = "arc-iac-sf-dev-shankar-terraform-statefile"
dynamodb_table = "arc-iac-sf-dev-shankar-state-lock"
encrypt        = true
profile        = "sf_poc"
