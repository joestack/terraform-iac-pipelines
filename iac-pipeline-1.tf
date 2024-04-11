### GitHub Repo(s)

resource "github_repository" "iacp-1" {
  name        = "${var.name}-1-infra"
  description = "Home of ${var.name}-infra"
  visibility = "public"
  auto_init = true
}

#### Terraform Workspace(es) and Variables

resource "tfe_workspace" "iacp-1" {
  name         = "${var.name}-1-infra"
  organization = var.terraform_org
  tag_names    = ["${var.name}", "infra"]
  vcs_repo {
    identifier = github_repository.iacp-1.full_name
    oauth_token_id = var.oauth_token_id
  }
  allow_destroy_plan = true
  auto_apply = true
  global_remote_state = true 
  queue_all_runs = false  
  terraform_version = "1.6.6" 
}

# resource "tfe_variable" "aws_region" {
#   key          = "aws_region"
#   value        = EU-WEST-1
#   category     = "terraform"
#   workspace_id = tfe_workspace.cia-demo-infra.id
#   description  = "AWS Region to be used"
# }

