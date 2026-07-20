# Infrastructor as Code

## Why does IaC matter for DevOps?
IaC is an important part of implementing DevOps practices and continuous integration/continuous delivery (CI/CD).

IaC takes away the majority of provisioning work from developers, who can execute a script to have their infrastructure ready to go.

That way, application deployments aren’t held up waiting for the infrastructure, and sysadmins aren’t managing time-consuming manual processes.

CI/CD relies on ongoing automation and continuous monitoring throughout the application life cycle, from integration and testing to delivery and deployment.

In order for an environment to be automated, it needs to be consistent. Automating application deployments doesn’t work when the development team deploys applications or configures environments one way and the operations teams deploys and configures another way.

Aligning development and operations teams through a DevOps approach leads to fewer errors, manual deployments, and inconsistencies. IaC helps you to align development and operations because both teams can use the same description of the application deployment, supporting a DevOps approach.

## Infrastructure as Code (IaC)
Infrastructure as Code (IaC) is the managing and provisioning of infrastructure through code instead of through manual processes.

With IaC, configuration files are created that contain your infrastructure specifications, which makes it easier to edit and distribute configurations. It also ensures that it is provisioned the same environment every time. By codifying and documenting your configuration specifications, IaC aids configuration management and helps you to avoid undocumented, ad-hoc configuration changes.

Version control is an important part of IaC, and the configuration files should be under source control just like any other software source code file.

Deploying your infrastructure as code also means that you can divide your infrastructure into modular components that can then be combined in different ways through automation.

Automating infrastructure provisioning with IaC means that developers don’t need to manually provision and manage servers, operating systems, storage, and other infrastructure components each time they develop or deploy an application.

Codifying your infrastructure gives you a template to follow for provisioning, and although this can still be accomplished manually, an automation tool, such as Red Hat® Ansible® Automation Platform, can do it for you.

https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac \
https://www.ibm.com/topics/infrastructure

#### What is Infrastructure as Code? Difference of Infrastructure as Code Tools
https://www.youtube.com/watch?v=POPP2WTJ8es