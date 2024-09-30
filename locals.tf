locals {
  project = {
    "fem-eci-project" = {
      description = "Example description of project"
    }
  }
  workspace = {
    "fem-eci-tfe" = {
      description         = "Example description of workspace"
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-tfe"

    }
    "fem-eci-github" = {
      description         = "Example automation workspace for Github resources"
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      description         = "Example automation workspace for Github resources"
      execution_mode      = "local"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-github"
    }




    "fem-eci-aws-network" = {
      description         = "Automation for AWS network resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-aws-network"

      variables = [
        {
          category = "terraform"
          hcl      = true
          key      = "azs"
          value    = jsonencode(["us-west-2a", "us-west-2b"])
        },
        {
          category = "terraform"
          key      = "cidr"
          value    = "10.0.0.0/16"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci"
        },
      ]
    }

    "fem-eci-aws-cluster-prod" = {
      description         = "Automation for AWS cluster resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-aws-cluster"

      variables = [
        {
          category = "terraform"
          key      = "domain"
          value    = "danko123.ninja"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
        {
          category = "terraform"
          key      = "name"
          value    = "fem-eci-ybasinnn"

        },
        {
          category = "terraform"
          key      = "vpc_name"
          value    = "fem-eci"
        },
      ]
    }
    "fem-eci-terraform-product-service" = {
      description         = "Automation for product service resources."
      execution_mode      = "remote"
      project_id          = module.project["fem-eci-project"].id
      vcs_repo_identifier = "${var.github_organization_name}/fem-eci-terraform-product-service"

      variables = [
        {
          category = "terraform"
          key      = "cluster_name"
          value    = "fem-eci-ybasinnn-prod"
        },
        {
          category = "terraform"
          key      = "environment"
          value    = "prod"
        },
      ]
    }
  }
}

