output "organization_identifier" {
  description = "Organization Identifier"
  value       = data.harness_platform_organization.selected.identifier
}

output "project_identifier" {
  description = "Project Identifier"
  value       = data.harness_platform_project.selected.identifier
}

output "pipeline_identifier" {
  description = "Pipeline Identifier"
  value       = harness_platform_pipeline.from_template.id
}

output "pipeline_url" {
  description = "Deep link to the created pipeline"
  value       = local.pipeline_url
}
