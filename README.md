# Terraform AWS Certificate Manager module

## Maintainer

* Platform Services

## Author

* Rupert Broad

## Version

Current version: v0.1.2

## Description

Creates AWS Certificate Manager certificates - does not support importing own certificates.

## Usage

Important: the DNS domain must already exist BEFORE trying to create a certificate.

In certain circumstances e.g. Cognito custom DNS, the certificate must be created in a specific region (us-east-1). When this is the case, create a separate provider for the region, as shown below.

### Cognito Example

```(terraform)
module "acm" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-acm.git?ref=v0.1.1"
  providers = {
    aws = aws.us_east_1
  }

  domain_name = "infra.dev.ohpen.tech"
  host_name   = "auth"
  tags        = local.tags
}
```

### Non-cognito example

```(terraform)
module "acm" {
  source = "git@bitbucket.org:ohpen-dev/terraform-aws-ohp-acm.git?ref=v0.1.1"

  domain_name = "infra.dev.ohpen.tech"
  host_name   = "my-host"
  tags        = local.tags
}
```

## Documentation

[confluence](https://ohpendev.atlassian.net/wiki/spaces/CCE/pages/2062320795/Terraform+Modules)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_acm_certificate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) |
| [aws_acm_certificate_validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain\_name | (Required) Domain zone name | `string` | n/a | yes |
| host\_name | (Required) Hostname | `string` | n/a | yes |
| tags | (Required) Map of tags to apply to repository | `map(any)` | n/a | yes |
| certificate\_transparency\_logging\_preference | (Optional) Specifies whether certificate details should be added to a certificate transparency log | `string` | `null` | no |
| subject\_alternative\_names | (Optional) Set of domains that should be SANs in the issued certificate | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the certificate |
| id | The ARN of the certificate |
| status | Status of the certificate |
