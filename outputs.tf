output "state_bucket_names" {
    description = "The names of the S3 buckets that store Terraform state"
    value = aws_s3_bucket.state_bucket.*.id
}

output "state_lock_table_name" {
    description = "The name of the DynamoDB table that stores Terraform state lock"
    value = aws_dynamodb_table.state_lock.name
}