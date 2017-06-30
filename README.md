# ECS Framework - Terraform

## Discription

This is a Multi-Stack Terraform implementation of a single ECS Cluster. The design is to have on Infrastructure stack and one or more Application stacks. The Infrastructure stack would contain the core infrastructure of the cluster, such as Autoscaling Groups, IAM Roles, Application Load Balancers, Etc. The Application stack would contain the ECS Service Definition and the ECS Task Definition. This can be added to and existing cluster configuration with new Services being added in conjunction with their corresponding resources in the Infrastructure stack.

------
## Philosophy

This method was written to correct a state lock problem for Ancestry.com's ECS
Deployment rollout. The problem was there was a possibility that multiple services within
a ECS Cluster could be deployed simultaneously. if this occurred then the Terraform state, which is remotely stored, would be locked and fail one build or worse, become inconsistent.   There were two main features that contributed to this attempt.
1. The application code and application specific infrastructure would be held in one location, and have its own deployment pipeline, and the *actual* infrastructure would be held and built in another.
2. The application code and infrastructure code would be structured in a many to one relationship with each application pulling the infrastructure output using remote state references for Cluster name, IAM roles, Security Groups, Etc.

------
## Use

To use this framework, replace the VPC and ECR (or other repo) specific variables in the variable.tf file within each stack.

------
## Jenkins

The Jenkinsfiles are provided as references
