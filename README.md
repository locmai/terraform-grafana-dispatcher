# Dispatcher

Dispatcher is a repository for the Grafana Cloud playground setup and for personal use only.

The prerequisites are:

- Google Cloud storage as Terraform state backend.
- Grafana Cloud Terraform provider.
- Discord setting.

## Manual steps required

Not that I'm too lazy to automate these steps but I'm ... lazy.

### GCS bucket as Terraform backend

TBD

### Sign up for a Grafana free account and create initial API key

TBD

### Setup Discord server and webhook

TBD

### Install Terraform

TBD

## Generate terraform-docs

Install the terraform-docs:

```
go install github.com/terraform-docs/terraform-docs@v0.16.0
```

Then run:

```
terraform-docs markdown table --output-file README.md --output-mode inject .
```

or:

```
make readme
```

It will generate the below sections.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 1.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 1.33.0 |
| <a name="provider_grafana.cloud"></a> [grafana.cloud](#provider\_grafana.cloud) | 1.33.0 |
| <a name="provider_grafana.sm"></a> [grafana.sm](#provider\_grafana.sm) | 1.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_api_key.dispatcher](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/api_key) | resource |
| [grafana_cloud_api_key.metrics_publish](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/cloud_api_key) | resource |
| [grafana_cloud_stack.dispatcher](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/cloud_stack) | resource |
| [grafana_contact_point.discord](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/contact_point) | resource |
| [grafana_synthetic_monitoring_check.dns](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/synthetic_monitoring_check) | resource |
| [grafana_synthetic_monitoring_check.ping](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/synthetic_monitoring_check) | resource |
| [grafana_synthetic_monitoring_installation.sm_stack](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/resources/synthetic_monitoring_installation) | resource |
| [grafana_synthetic_monitoring_probes.main](https://registry.terraform.io/providers/grafana/grafana/1.33.0/docs/data-sources/synthetic_monitoring_probes) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_discord_webhook_url"></a> [discord\_webhook\_url](#input\_discord\_webhook\_url) | Discord Webhook URL from Server Setting's integrations tab | `string` | n/a | yes |
| <a name="input_grafana_cloud_api_key"></a> [grafana\_cloud\_api\_key](#input\_grafana\_cloud\_api\_key) | Grafana Cloud API key for creating initialize Dispatcher cloud Stack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dispatcher"></a> [dispatcher](#output\_dispatcher) | Dispatcher cloud stack data |
| <a name="output_probers"></a> [probers](#output\_probers) | Public probers |
<!-- END_TF_DOCS -->