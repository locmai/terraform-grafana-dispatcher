output "dispatcher" {
  value = grafana_cloud_stack.dispatcher
  description = "Dispatcher cloud stack data"
}

output "probers" {
  value = data.grafana_synthetic_monitoring_probes.main
  description = "Public probers"
}