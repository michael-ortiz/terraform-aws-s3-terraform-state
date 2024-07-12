# AWS S3 Terraform State

## Introduction

This is a public and open source module that allows you to create all the necesary AWS Infrastructure to have your Terraform state stored and encrypted in S3.

Read more on how to hook this up with your current Terraform project:

https://developer.hashicorp.com/terraform/language/settings/backends/s3

## Example Usage

To use this module, place this code in your Terraform:

```hcl
module "s3_terraform_state" {
  source  = "michael-ortiz/s3-terraform-state/aws"
  version = "~> 1.0"

  # Optional Bucket Names to store state in multiple buckets
  state_bucket_names = ["MY_S3_STATE_BUCKET_NAME"]

  # Optional DynamoDB Lock Name
  state_lock_table_name = "MY_S3_STATE_BUCKET_NAME"
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.state_lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.state_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.state_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.state_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_state_bucket_names"></a> [state\_bucket\_names](#input\_state\_bucket\_names) | A list of S3 bucket to create to store terraform state | `list(string)` | `null` | no |
| <a name="input_state_lock_table_name"></a> [state\_lock\_table\_name](#input\_state\_lock\_table\_name) | The name of the DynamoDB table to create to store Terraform state lock | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_state_bucket_names"></a> [state\_bucket\_names](#output\_state\_bucket\_names) | The names of the S3 buckets that store Terraform state |
| <a name="output_state_lock_table_name"></a> [state\_lock\_table\_name](#output\_state\_lock\_table\_name) | The name of the DynamoDB table that stores Terraform state lock |
