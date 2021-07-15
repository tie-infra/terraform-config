terraform {
  backend "remote" {
    organization = "tie-infra"
    workspaces {
      name = "terraform-config"
    }
  }

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

#module "domain_wtf_tie" {
#  source = "./domain/wtf_tie"
#}

#module "domain_rip_tie" {
#  source = "./domain/rip_tie"
#}
