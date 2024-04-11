# tfc-iac-pipelines

The purpose of this repository (tfc-iac-pipelines) is to setup the necessary IaC-pipeline or IaC-pilelines that belong to the scope of an IT-Service. An IT-Service is usually built upon several artifacts describing its entire features and functionallities.

As an example: A "demo-app" consits of 3 different artifacts (Infra, Network, Application). Each artifact is based on its own IaC-Pipeline: One for the infrastructure resources, one for the network and security, and one for the application code. So the final "demo-app" is stacked together by 3 artifacts that are individually managed through dedicated IaC-Pipelines.

To ensure security and compliance with organizational rules by proof of trust, these artifacts are maintained with segregation of responabilities. Each artifact-pipeline has its own set of policies that ensure the compliancy status of the result at the egress of that pipeline. Combined with notation of identity (authentication and authorization) prior to accessing such an IaC pipeline, this ensures agile devops in a self-service fashion including guardrails. To be more precisely, these pipelines are named "Continuous Infrastructure Automation Pipelines" (CIA-Pipelines) further on.  

This repo contains the IaC declarations to create 3 CIA-pipelines that belong to an IT-Service. Each pipeline consists on a) a dedicated VCS repository as home for its IaC declarations that is
b) connected to a dedicated Terraform-Workspace that is assigned with its own set of policies, variables and secrets.

Bootstrap Landingzone: Admin--->TFE-API--->Bootstrap-Module-+-Variables-->Workspace-0-LandinZone-->{

CIA-1-Infra: Team-1--->VCS-Repo-1--->Workspace-1--->Workload-1

CIA-2-Monitoring: Team-2--->VCS-Repo-2--->Workspace-2--->Workload-2

CIA-3-Application: Team-3--->VCS-Repo-3--->Workspace-3--->Workload-3

}


Now you can easily describe and publish the landig-zone for an IT-Service as an administrative task that enables your developer teams to do their work in a self-service agile fashion. If you like to automate this administrative task take a look at https://github.com/joestack/tfc-api-bootstrap-script.git. This script automates all API calls towards Terraform Cloud/Enterprise to publish a landingzone. Its purpose is also to provide a secure methodologie to inject the required sensitive information (cloud credentials, Keys, ...) aka "Secret-Zero" without the need for any further tool.   