variable "state_bucket_names" {
  description = "A list of S3 bucket to create to store terraform state"
  type        = list(string)
  default     = null
}

variable "state_lock_table_name" {
  description = "The name of the DynamoDB table to create to store Terraform state lock"
  type        = string
  default     = null
}