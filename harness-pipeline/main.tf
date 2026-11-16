
data "harness_platform_organization" "selected" {
  identifier = var.organization_id
}

data "harness_platform_project" "selected" {
  identifier = var.project_id
  org_id     = data.harness_platform_organization.selected.id
}

resource "harness_platform_pipeline" "from_template" {
  identifier = local.fmt_identifier
  name       = var.pipeline_name
  org_id     = data.harness_platform_organization.selected.id
  project_id = data.harness_platform_project.selected.id

  yaml = templatefile("${local.source_directory}/pipelines/pipe_from_template.yaml.tpl", {
    PIPELINE_NAME       = var.pipeline_name
    PIPELINE_IDENTIFIER = local.fmt_identifier
    ORGANIZATION_ID     = data.harness_platform_organization.selected.id
    PROJECT_ID          = data.harness_platform_project.selected.id
    TEMPLATE_REF        = local.template_ref_scoped
  })
}
