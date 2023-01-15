terraform {
  backend "gcs" {
    bucket = "tf-state-lmailabs"
    prefix = "grafana"
  }

  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.33.0"
    }
  }
}

# Initial provider for creating Dispatcher cloud stack
provider "grafana" {
  alias         = "cloud"
  cloud_api_key = var.grafana_cloud_api_key
}

resource "grafana_cloud_stack" "dispatcher" {
  provider = grafana.cloud

  name = "locmai"
  slug = "locmai"

  region_slug = "prod-ap-southeast-0"
}

resource "grafana_api_key" "dispatcher" {
  provider = grafana.cloud

  cloud_stack_slug = grafana_cloud_stack.dispatcher.slug
  name             = "dispatcher-key"
  role             = "Admin"
}

# Cloud stack provider as default
provider "grafana" {
  url  = grafana_cloud_stack.dispatcher.url
  auth = grafana_api_key.dispatcher.key
}

resource "grafana_cloud_api_key" "metrics_publish" {
  provider = grafana.cloud

  name           = "MetricsPublisherForSM"
  role           = "MetricsPublisher"
  cloud_org_slug = grafana_cloud_stack.dispatcher.org_slug
}

resource "grafana_synthetic_monitoring_installation" "sm_stack" {
  provider = grafana.cloud

  stack_id              = grafana_cloud_stack.dispatcher.id
  metrics_instance_id   = grafana_cloud_stack.dispatcher.prometheus_user_id
  logs_instance_id      = grafana_cloud_stack.dispatcher.logs_user_id
  metrics_publisher_key = grafana_cloud_api_key.metrics_publish.key
}

provider "grafana" {
  alias           = "sm"
  sm_access_token = grafana_synthetic_monitoring_installation.sm_stack.sm_access_token
}
