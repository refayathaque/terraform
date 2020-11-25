# Terraform

Infrastructure as Code  
Automation of your infrastructure  
Keep your infrastructure in a certain state (compliant)  
-E.g., 2 web instances w/ 2 volumes, and 1 load balancer  
Make your infrastructure auditable  
-Keep your infrastructure change history in version control (b/c it's infrastructure as code)  
Ansible, Chef, Puppet, SaltStack have a focus on automating installation and configuration of software  
-Keeping the machines in compliance, in a certain state  
Terraform can automate provisioning of the infrastructure itself  
-E.g., using AWS, GCP, Azure, etc. APIs  
-Works well with automation software like Ansible to install software after the infrastructure is provisioned  

## Basics

HCL (HashiCorp Configuration Language) - terraform syntax  
Always run `terraform init` first - initializes the provider plugins
Run `terraform plan` to see what changes will be made  
Then run `terraform apply`  to execute plan  
-^ same as running `terraform plan -out out.terraform ; terraform apply out.terraform ; rm out.terraform`  (do this if you want to be extra careful)  
Run `terraform destroy` to tear down the infrastructure

### Useful links:
[Repo for Udemy course - "Learn DevOps: Infrastructure Automation w/ Terraform"](https://github.com/wardviaene/terraform-course).  
[Good intro](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca).  
[GitLab integration intro](https://timberry.dev/posts/terraform-pipelines-in-gitlab/).  
