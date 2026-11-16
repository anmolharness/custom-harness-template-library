locals {
  required_tags = {
    created_by : "Terraform"
    harnessSolutionsFactory : "true"
  }

  common_tags = merge(
    var.tags,
    local.required_tags
  )

  # Harness Tags are read into Terraform as a standard Map entry but needs to be
  # converted into a list of key:value entries
  common_tags_tuple = [for k, v in local.common_tags : "${k}:${v}"]

  fmt_identifier = replace(
    replace(var.pipeline_name, " ", "_"),
    "-",
    "_"
  )

  # Account-scope templates are referenced with an "account." prefix. The
  # pipeline omits versionLabel so Harness always resolves the stable version.
  template_ref_scoped = "account.${var.template_ref}"

  pipeline_url = join("/",
    [
      trimsuffix(replace(var.harness_platform_url, "gateway", "ng"), "/"),
      "account",
      var.harness_platform_account,
      "all/orgs",
      data.harness_platform_organization.selected.id,
      "projects",
      data.harness_platform_project.selected.id,
      "pipelines",
      harness_platform_pipeline.from_template.id,
      "pipeline-studio"
    ]
  )

  source_directory = "${path.module}/templates"
}
