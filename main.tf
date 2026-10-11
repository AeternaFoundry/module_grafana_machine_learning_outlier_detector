resource "grafana_machine_learning_outlier_detector" "machine_learning_outlier_detectors" {
  for_each = var.machine_learning_outlier_detectors

  datasource_type = each.value.datasource_type
  datasource_uid  = each.value.datasource_uid
  metric          = each.value.metric
  name            = each.value.name
  query_params    = each.value.query_params
  description     = each.value.description
  interval        = each.value.interval

  algorithm {
    dynamic "config" {
      for_each = each.value.algorithm.config != null ? [each.value.algorithm.config] : []
      content {
        epsilon = config.value.epsilon
      }
    }
    name        = each.value.algorithm.name
    sensitivity = each.value.algorithm.sensitivity
  }
}

