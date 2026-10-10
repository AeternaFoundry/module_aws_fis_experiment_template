output "fis_experiment_templates_id" {
  description = "Map of id values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "fis_experiment_templates_action" {
  description = "Map of action values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.action if v.action != null && length(v.action) > 0 }
}
output "fis_experiment_templates_description" {
  description = "Map of description values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.description if v.description != null && length(v.description) > 0 }
}
output "fis_experiment_templates_experiment_options" {
  description = "Map of experiment_options values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => one(v.experiment_options) if v.experiment_options != null && length(v.experiment_options) > 0 }
}
output "fis_experiment_templates_experiment_report_configuration" {
  description = "Map of experiment_report_configuration values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => one(v.experiment_report_configuration) if v.experiment_report_configuration != null && length(v.experiment_report_configuration) > 0 }
}
output "fis_experiment_templates_log_configuration" {
  description = "Map of log_configuration values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => one(v.log_configuration) if v.log_configuration != null && length(v.log_configuration) > 0 }
}
output "fis_experiment_templates_region" {
  description = "Map of region values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.region if v.region != null && length(v.region) > 0 }
}
output "fis_experiment_templates_role_arn" {
  description = "Map of role_arn values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.role_arn if v.role_arn != null && length(v.role_arn) > 0 }
}
output "fis_experiment_templates_stop_condition" {
  description = "Map of stop_condition values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.stop_condition if v.stop_condition != null && length(v.stop_condition) > 0 }
}
output "fis_experiment_templates_tags" {
  description = "Map of tags values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "fis_experiment_templates_tags_all" {
  description = "Map of tags_all values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "fis_experiment_templates_target" {
  description = "Map of target values across all fis_experiment_templates, keyed the same as var.fis_experiment_templates"
  value       = { for k, v in aws_fis_experiment_template.fis_experiment_templates : k => v.target if v.target != null && length(v.target) > 0 }
}

