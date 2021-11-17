# Terraform Module - AWS Certificate Manager

[![license](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/ohpensource/terraform-aws-ohp-acm/continuous-delivery)

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/ohpensource/terraform-aws-ohp-acm)

## Maintainer

* Platform Services

## Description

Creates AWS Certificate Manager certificates - does not support importing own certificates.

## Usage

Important: the DNS domain must already exist BEFORE trying to create a certificate.

In certain circumstances e.g. Cognito custom DNS, the certificate must be created in a specific region (us-east-1). When this is the case, create a separate provider for the region, as shown below.

### Cognito Example

```(terraform)
module "acm" {
  source = "github.com/ohpensource/terraform-aws-ohp-acm?ref=v0.0.1"
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
  source = "github.com/ohpensource/terraform-aws-ohp-acm?ref=v0.0.1"

  domain_name = "infra.dev.ohpen.tech"
  host_name   = "my-host"
  tags        = local.tags
}
```

## Documentation

[confluence](https://ohpendev.atlassian.net/wiki/spaces/CCE/pages/2062320795/Terraform+Modules)

<!--- BEGIN_TF_DOCS --->
<!--- END_TF_DOCS --->
