variable "grafana_cloud_api_key" {
  type        = string
  description = "Grafana Cloud API key for creating initialize Dispatcher cloud Stack"
  sensitive = true
}

variable "discord_webhook_url" {
  type        = string
  description = "Discord Webhook URL from Server Setting's integrations tab"
  sensitive = true
}