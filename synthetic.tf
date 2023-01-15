data "grafana_synthetic_monitoring_probes" "main" {
  provider = grafana.sm

  depends_on = [
    grafana_synthetic_monitoring_installation.sm_stack
  ]
}

resource "grafana_synthetic_monitoring_check" "dns" {
  provider = grafana.sm

  for_each = toset(var.domain_list)
  job      = "dns"
  target   = each.key
  enabled  = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.Atlanta,
    data.grafana_synthetic_monitoring_probes.main.probes.Singapore,
    data.grafana_synthetic_monitoring_probes.main.probes.Frankfurt,
  ]

  settings {
    dns {}
  }
}

resource "grafana_synthetic_monitoring_check" "ping" {
  provider = grafana.sm

  for_each = toset(var.domain_list)
  job      = "ping"
  target   = each.key
  enabled  = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.Atlanta,
    data.grafana_synthetic_monitoring_probes.main.probes.Singapore,
    data.grafana_synthetic_monitoring_probes.main.probes.Frankfurt,
  ]

  settings {
    ping {}
  }
}