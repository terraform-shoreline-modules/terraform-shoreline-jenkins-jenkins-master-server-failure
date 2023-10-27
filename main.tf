terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "jenkins_master_server_failure" {
  source    = "./modules/jenkins_master_server_failure"

  providers = {
    shoreline = shoreline
  }
}