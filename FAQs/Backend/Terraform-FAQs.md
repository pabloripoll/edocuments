# Terraform FAQs

Senior-level Terraform interview FAQs with practical answers.

---

## 1) What is Terraform?

Terraform is an Infrastructure as Code tool used to define, provision, and manage infrastructure through declarative configuration files. It supports multiple cloud providers and allows teams to version-control infrastructure changes like application code.

---

## 2) What does “declarative” mean in Terraform?

Declarative means you describe the desired end state of infrastructure, and Terraform figures out how to reach that state. You define *what* you want, not *how* to do it step by step.

---

## 3) What is the Terraform workflow?

The standard workflow is:
1. `terraform init` to initialize the working directory and download providers
2. `terraform plan` to preview changes
3. `terraform apply` to make changes
4. `terraform destroy` to remove resources when needed

Senior users also incorporate formatting, validation, and automated review.

---

## 4) What is the Terraform state file?

The state file tracks the relationship between your configuration and real infrastructure. It maps resources, metadata, and dependencies so Terraform knows what exists and what it manages. Protecting state is critical because it may contain sensitive data and is the source of truth for changes.

---

## 5) Why is remote state important?

Remote state enables collaboration, locking, durability, and centralized management. It prevents multiple users from corrupting state and supports safer teamwork in CI/CD environments. Common backends include S3, Azure Blob, GCS, and Terraform Cloud.

---

## 6) What is state locking?

State locking prevents concurrent Terraform operations from modifying the same state at the same time. This avoids race conditions and state corruption. Locking is usually provided by the backend or state management system.

---

## 7) What are Terraform providers?

Providers are plugins that allow Terraform to interact with APIs such as AWS, Azure, GCP, Kubernetes, GitHub, and many others. They are responsible for resource creation, reading, updating, and deletion.

---

## 8) What are Terraform modules?

Modules are reusable containers for Terraform resources and configurations. They help standardize infrastructure, reduce duplication, and improve maintainability. Senior teams often use modules for VPCs, clusters, databases, and application environments.

---

## 9) What is the difference between a module and a root module?

The root module is the current working directory where Terraform is executed. A child module is a reusable component called by the root module or another module. The root module is the entry point; child modules encapsulate reusable infrastructure patterns.

---

## 10) What is the purpose of `terraform plan`?

`terraform plan` previews the changes Terraform will make, showing what will be created, modified, or destroyed. It is essential for review, safety, and automation. In mature workflows, plans are reviewed before applying changes.

---

## 11) What is the difference between `count` and `for_each`?

Both are used to create multiple instances of a resource. `count` is index-based and simple, but less expressive. `for_each` is better when resources are keyed by unique identifiers and when stable addressing matters, especially in long-lived environments.

---

## 12) What are Terraform variables?

Variables parameterize Terraform configurations and make them reusable across environments. They can be defined with defaults, type constraints, and validation rules. They are commonly used to customize names, sizes, regions, and tags.

---

## 13) What are outputs in Terraform?

Outputs expose useful values after a Terraform apply, such as IP addresses, resource IDs, or connection strings. They are used to feed information into other systems, modules, or automation pipelines.

---

## 14) What is the difference between `terraform refresh`, `plan`, and `apply`?

- **refresh** updates state with real infrastructure changes
- **plan** compares config, state, and actual infrastructure to show proposed changes
- **apply** executes the changes

In recent Terraform versions, refresh behavior is mostly integrated into planning workflows.

---

## 15) How do you manage multiple environments in Terraform?

Common approaches include separate state files, separate workspaces, directory separation, or environment-specific variable files. Senior teams usually prefer clear state isolation and predictable structure to avoid accidental cross-environment changes.

---

## 16) What are Terraform workspaces?

Workspaces allow multiple state instances for the same configuration. They can be useful for simple environment separation, but they are often overused. For more complex setups, separate state backends or directories are usually clearer and safer.

---

## 17) What is a data source in Terraform?

A data source reads information from existing infrastructure or external APIs without managing it directly. It lets Terraform reference existing resources, such as an AMI, VPC, secret, or remote data set.

---

## 18) How do you handle secrets in Terraform?

Secrets should not be hardcoded in files or committed to version control. Use secret managers, environment variables, encrypted backends, CI/CD secret stores, and sensitive variables. Also remember that sensitive values may still exist in state, so state security matters greatly.

---

## 19) What are common Terraform best practices?

Important best practices include:
- use remote state with locking
- version-control all IaC
- use modules for reuse
- keep modules small and focused
- pin provider versions
- avoid manual drift
- use `for_each` where identity matters
- review plans before apply
- protect state and secrets
- run `fmt`, `validate`, and policy checks in CI

---

## 20) How do you deal with drift in Terraform-managed infrastructure?

Drift happens when infrastructure changes outside Terraform. You detect it by running plans regularly and comparing state to reality. The fix is usually to bring changes back under Terraform control, import unmanaged resources, or correct the configuration and reapply. Good governance and restricting manual changes help prevent drift.

---

If you want, I can also provide:
- **20 advanced Terraform questions**
- **Terraform interview questions for AWS specifically**
- **Terraform + Kubernetes + CI/CD senior interview set**
- **a Terraform cheat sheet with common commands and patterns**
