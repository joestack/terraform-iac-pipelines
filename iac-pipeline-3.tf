### GitHub Repo(s)

resource "github_repository" "iacp-3" {
  name        = "${var.name}-3-app"
  description = "Home of ${var.name}-app"
  visibility = "public"
  auto_init = true
}

#### Terraform Workspace(es) and Variables

resource "tfe_workspace" "iacp-3" {
  name         = "${var.name}-3-app"
  organization = var.terraform_org
  tag_names    = ["${var.name}", "app"]
  vcs_repo {
    identifier = github_repository.iacp-3.full_name
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
