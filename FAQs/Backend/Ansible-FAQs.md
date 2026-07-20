# Ansible FAQs

Terraform is a dedicated IaC tool designed to build, change, and manage infrastructure in a safe, repeatable way. Ansible is a multipurpose IT automation engine built to configure systems, deploy software, and orchestrate complex tasks across servers, network devices, security tools, and hybrid environments.

- [Ansible vs. Terraform - Red Hat](https://www.redhat.com/en/topics/automation/ansible-vs-terraform)

Senior-level Ansible interview FAQs with practical answers.

---

## 1) What is Ansible?

Ansible is an open-source automation tool used for configuration management, application deployment, orchestration, and task automation. It is agentless, which means it typically connects to managed nodes over SSH or WinRM without requiring installed agents.

---

## 2) What makes Ansible different from other configuration management tools?

Ansible is known for its simplicity, agentless architecture, YAML-based playbooks, and strong declarative automation model. Compared with tools that require agents or more complex DSLs, Ansible is often easier to adopt and integrate into existing systems.

---

## 3) What is a playbook?

A playbook is a YAML file that defines a set of automation tasks to run on target hosts. It describes the desired configuration or workflow, including tasks, variables, handlers, roles, and conditions.

---

## 4) What is an inventory?

An inventory is the list of hosts or groups of hosts Ansible manages. It can be static or dynamic, and it is used to target specific environments like dev, staging, or production.

---

## 5) What is the difference between a task and a play?

A task is a single action, such as installing a package or copying a file. A play maps tasks to one or more hosts and defines how those tasks should be executed. A playbook contains one or more plays.

---

## 6) What is idempotency in Ansible?

Idempotency means running the same automation multiple times produces the same end state without unwanted side effects. This is a core Ansible concept and is crucial for safe configuration management.

---

## 7) What are roles used for?

Roles provide a standardized way to organize Ansible code. They separate tasks, handlers, variables, templates, defaults, and files into reusable units, improving maintainability and reusability in larger projects.

---

## 8) What are handlers?

Handlers are special tasks that run only when notified by another task, typically when a change occurs. They are commonly used for actions like restarting services after configuration updates.

---

## 9) What are variables in Ansible and how are they used?

Variables allow playbooks and roles to be dynamic and reusable. They can come from inventory, group vars, host vars, role defaults, extra vars, facts, or registered task results. Senior users must understand precedence, because variable resolution can be subtle.

---

## 10) What is variable precedence?

Variable precedence determines which value wins when the same variable is defined in multiple places. In general, extra vars have very high precedence, while role defaults are among the lowest. Understanding precedence is essential for debugging unexpected behavior.

---

## 11) What are facts?

Facts are pieces of information gathered from managed hosts, such as OS type, IP address, memory, and CPU details. They are collected by the setup module and can be used to make playbooks adaptive to the target system.

---

## 12) What are templates used for?

Templates, usually Jinja2 templates, allow you to generate configuration files dynamically using variables, loops, and conditions. They are commonly used for application configs, system settings, and service definitions.

---

## 13) What are modules in Ansible?

Modules are the building blocks that perform tasks, such as `apt`, `yum`, `copy`, `template`, `service`, or `user`. Ansible includes many built-in modules and supports community modules for broader integration.

---

## 14) What is the difference between a module and a plugin?

Modules perform actions on managed nodes. Plugins extend Ansible’s behavior on the control node, such as inventory plugins, callback plugins, lookup plugins, filter plugins, and connection plugins.

---

## 15) What is a dynamic inventory?

A dynamic inventory is generated from an external source such as AWS, Azure, GCP, VMware, or a CMDB. It is useful in cloud environments where hosts are frequently created and destroyed.

---

## 16) How do you handle secrets in Ansible?

Use Ansible Vault or external secret managers to protect sensitive data such as passwords, API keys, and certificates. Never store secrets in plaintext in repositories. Senior teams often integrate Ansible with vault systems or CI/CD secret stores.

---

## 17) What is Ansible Vault?

Ansible Vault encrypts sensitive content such as variables, files, or entire playbooks. It allows secrets to live in version control in encrypted form while being decrypted at runtime with the correct vault password or identity.

---

## 18) How do you debug Ansible playbooks?

Common debugging techniques include using `-v`, `-vvv`, `debug` tasks, `register`, `failed_when`, `changed_when`, and `--check`. Reviewing inventory, variable precedence, and module output is often key to troubleshooting.

---

## 19) What are best practices for writing Ansible playbooks?

Best practices include:
- using roles to organize code
- keeping tasks small and readable
- making tasks idempotent
- avoiding shell/command when a module exists
- using variables and defaults properly
- validating templates
- using Vault for secrets
- testing with `--check` and linting tools
- separating environment-specific values cleanly

---

## 20) How does Ansible fit into a DevOps toolchain?

Ansible is often used for configuration management, app deployment, patching, orchestration, and bootstrap automation. It integrates well with CI/CD pipelines, cloud provisioning tools like Terraform, and container platforms for infrastructure automation around the platform layer.

---

If you want, I can also provide:
- **20 more advanced Ansible questions**
- **Ansible interview FAQs focused on roles, inventory, and Vault**
- **Ansible + Terraform + Kubernetes senior DevOps interview set**
- **a quick Ansible cheat sheet with common commands and patterns**
