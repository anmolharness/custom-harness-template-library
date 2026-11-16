# Harness Account Setup
variable "harness_platform_url" {
  type        = string
  description = "[Optional] Enter the Harness Platform URL.  Defaults to Harness SaaS URL"
  default     = "https://app.harness.io/gateway"
}

variable "harness_platform_account" {
  type        = string
  description = "[Required] Enter the Harness Platform Account Number"
}

variable "organization_id" {
  type        = string
  description = "[Required] Organization the pipeline will be created in.  Must exist before execution"
}

variable "project_id" {
  type        = string
  description = "[Required] Project the pipeline will be created in.  Must exist before execution"
}

variable "pipeline_name" {
  type        = string
  description = "[Required] Name for the new pipeline"
}

variable "template_ref" {
  type        = string
  description = "[Required] Identifier of the account-scope pipeline template to instantiate (stable version is used)"
}

variable "tags" {
  type        = map(any)
  description = "[Optional] Provide a Map of Tags to associate with the resources"
  default     = {}
}
