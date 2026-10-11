output "machine_learning_outlier_detectors_id" {
  description = "Map of id values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no id are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.id if v.id != null && length(v.id) > 0 }
}
output "machine_learning_outlier_detectors_algorithm" {
  description = "Map of algorithm values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no algorithm are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => one(v.algorithm) if v.algorithm != null && length(v.algorithm) > 0 }
}
output "machine_learning_outlier_detectors_datasource_type" {
  description = "Map of datasource_type values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no datasource_type are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.datasource_type if v.datasource_type != null && length(v.datasource_type) > 0 }
}
output "machine_learning_outlier_detectors_datasource_uid" {
  description = "Map of datasource_uid values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no datasource_uid are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.datasource_uid if v.datasource_uid != null && length(v.datasource_uid) > 0 }
}
output "machine_learning_outlier_detectors_description" {
  description = "Map of description values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no description are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.description if v.description != null && length(v.description) > 0 }
}
output "machine_learning_outlier_detectors_interval" {
  description = "Map of interval values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no interval are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.interval if v.interval != null }
}
output "machine_learning_outlier_detectors_metric" {
  description = "Map of metric values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no metric are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.metric if v.metric != null && length(v.metric) > 0 }
}
output "machine_learning_outlier_detectors_name" {
  description = "Map of name values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no name are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.name if v.name != null && length(v.name) > 0 }
}
output "machine_learning_outlier_detectors_query_params" {
  description = "Map of query_params values across all machine_learning_outlier_detectors, keyed the same as var.machine_learning_outlier_detectors except keys with no query_params are omitted"
  value       = { for k, v in grafana_machine_learning_outlier_detector.machine_learning_outlier_detectors : k => v.query_params if v.query_params != null && length(v.query_params) > 0 }
}

