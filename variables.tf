variable "grafana_cloud_api_key" {
  type        = string
  description = "Grafana Cloud API key for creating initialize Dispatcher cloud Stack"
  sensitive   = true
}

variable "discord_webhook_url" {
  type        = string
  description = "Discord Webhook URL from Server Setting's integrations tab"
  sensitive   = true
}

variable "name" {
  type        = string
  description = "Cloud stack name and slug"
}

variable "region_slug" {
  type        = string
  description = "Region slug"
}

variable "domain_list" {
  type        = list(any)
  description = "List of domain to check"
  default     = []
}
