variable "fis_experiment_templates" {
  description = <<EOT
Map of fis_experiment_templates, attributes below
Required:
    - description
    - role_arn
    - action (block):
        - action_id (required)
        - description (optional)
        - name (required)
        - parameter (optional, block):
            - key (required)
            - value (required)
        - start_after (optional)
        - target (optional, block):
            - key (required)
            - value (required)
    - stop_condition (block):
        - source (required)
        - value (optional)
Optional:
    - region
    - tags
    - tags_all
    - experiment_options (block):
        - account_targeting (optional)
        - empty_target_resolution_mode (optional)
    - experiment_report_configuration (block):
        - data_sources (optional, block):
            - cloudwatch_dashboard (optional, block):
                - dashboard_arn (optional)
        - outputs (optional, block):
            - s3_configuration (optional, block):
                - bucket_name (required)
                - prefix (optional)
        - post_experiment_duration (optional)
        - pre_experiment_duration (optional)
    - log_configuration (block):
        - cloudwatch_logs_configuration (optional, block):
            - log_group_arn (required)
        - log_schema_version (required)
        - s3_configuration (optional, block):
            - bucket_name (required)
            - prefix (optional)
    - target (block):
        - filter (optional, block):
            - path (required)
            - values (required)
        - name (required)
        - parameters (optional)
        - resource_arns (optional)
        - resource_tag (optional, block):
            - key (required)
            - value (required)
        - resource_type (required)
        - selection_mode (required)
EOT

  type = map(object({
    description = string
    role_arn    = string
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    action = list(object({
      action_id   = string
      description = optional(string)
      name        = string
      parameter = optional(list(object({
        key   = string
        value = string
      })))
      start_after = optional(set(string))
      target = optional(object({
        key   = string
        value = string
      }))
    }))
    stop_condition = list(object({
      source = string
      value  = optional(string)
    }))
    experiment_options = optional(object({
      account_targeting            = optional(string)
      empty_target_resolution_mode = optional(string)
    }))
    experiment_report_configuration = optional(object({
      data_sources = optional(object({
        cloudwatch_dashboard = optional(list(object({
          dashboard_arn = optional(string)
        })))
      }))
      outputs = optional(object({
        s3_configuration = optional(object({
          bucket_name = string
          prefix      = optional(string)
        }))
      }))
      post_experiment_duration = optional(string)
      pre_experiment_duration  = optional(string)
    }))
    log_configuration = optional(object({
      cloudwatch_logs_configuration = optional(object({
        log_group_arn = string
      }))
      log_schema_version = number
      s3_configuration = optional(object({
        bucket_name = string
        prefix      = optional(string)
      }))
    }))
    target = optional(list(object({
      filter = optional(list(object({
        path   = string
        values = set(string)
      })))
      name          = string
      parameters    = optional(map(string))
      resource_arns = optional(set(string))
      resource_tag = optional(list(object({
        key   = string
        value = string
      })))
      resource_type  = string
      selection_mode = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.fis_experiment_templates : (
        length(v.action) >= 1
      )
    ])
    error_message = "Each action list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.fis_experiment_templates : (
        length(v.stop_condition) >= 1
      )
    ])
    error_message = "Each stop_condition list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.fis_experiment_templates : (
        v.target == null || alltrue([for item in v.target : (item.resource_tag == null || (length(item.resource_tag) <= 50))])
      )
    ])
    error_message = "Each resource_tag list must contain at most 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.fis_experiment_templates : (
        v.experiment_report_configuration == null || (v.experiment_report_configuration.post_experiment_duration == null || (can(regex("^PT\\d+[M|H|S]$", v.experiment_report_configuration.post_experiment_duration))))
      )
    ])
    error_message = "must be in the format of PT10S"
  }
  validation {
    condition = alltrue([
      for k, v in var.fis_experiment_templates : (
        v.experiment_report_configuration == null || (v.experiment_report_configuration.pre_experiment_duration == null || (can(regex("^PT\\d+[M|H|S]$", v.experiment_report_configuration.pre_experiment_duration))))
      )
    ])
    error_message = "must be in the format of PT10S"
  }
  # Note: 24 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

