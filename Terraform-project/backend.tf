terraform {
  backend "s3" {
    bucket         = "<backend_bucket_name>"
    key            = "terraform/state"
    region         = "<region>"
    #dynamodb_table = "terraform_locks" // Optional for state locking
  }
}
