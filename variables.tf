variable "machine_learning_outlier_detectors" {
  description = <<EOT
Map of machine_learning_outlier_detectors, attributes below
Required:
    - datasource_type
    - datasource_uid
    - metric
    - name
    - query_params
    - algorithm (block):
        - config (optional, block):
            - epsilon (required)
        - name (required)
        - sensitivity (required)
Optional:
    - description
    - interval
EOT

  type = map(object({
    datasource_type = string
    datasource_uid  = string
    metric          = string
    name            = string
    query_params    = map(string)
    description     = optional(string)
    interval        = optional(number)
    algorithm = object({
      config = optional(object({
        epsilon = number
      }))
      name        = string
      sensitivity = number
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.machine_learning_outlier_detectors : (
        contains(["prometheus", "grafana-prometheus-datasource", "grafana-amazonprometheus-datasource", "loki", "grafana-loki-datasource", "graphite", "grafana-graphite-datasource", "grafana-datadog-datasource", "postgres", "grafana-postgresql-datasource", "doitintl-bigquery-datasource", "grafana-bigquery-datasource", "grafana-snowflake-datasource", "influxdb", "grafana-influxdb-datasource", "grafana-splunk-datasource", "elasticsearch", "grafana-elasticsearch-datasource", "grafana-mongodb-datasource"], v.datasource_type)
      )
    ])
    error_message = "must be one of: \"prometheus\", \"grafana-prometheus-datasource\", \"grafana-amazonprometheus-datasource\", \"loki\", \"grafana-loki-datasource\", \"graphite\", \"grafana-graphite-datasource\", \"grafana-datadog-datasource\", \"postgres\", \"grafana-postgresql-datasource\", \"doitintl-bigquery-datasource\", \"grafana-bigquery-datasource\", \"grafana-snowflake-datasource\", \"influxdb\", \"grafana-influxdb-datasource\", \"grafana-splunk-datasource\", \"elasticsearch\", \"grafana-elasticsearch-datasource\", \"grafana-mongodb-datasource\""
  }
  validation {
    condition = alltrue([
      for k, v in var.machine_learning_outlier_detectors : (
        contains(["mad", "dbscan"], v.algorithm.name)
      )
    ])
    error_message = "must be one of: \"mad\", \"dbscan\""
  }
  validation {
    condition = alltrue([
      for k, v in var.machine_learning_outlier_detectors : (
        v.algorithm.sensitivity >= 0 && v.algorithm.sensitivity <= 1.0
      )
    ])
    error_message = "must be between 0 and 1.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.machine_learning_outlier_detectors : (
        v.algorithm.config == null || (v.algorithm.config.epsilon >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
}

