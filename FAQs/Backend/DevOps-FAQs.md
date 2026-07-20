# DevOps FAQs

Senior-level DevOps interview FAQs with concise answers.

---

## 1) What is DevOps?

DevOps is a culture, set of practices, and tooling approach that unifies software development and operations to deliver software faster, more reliably, and with better feedback loops. It emphasizes automation, collaboration, continuous improvement, and shared responsibility.

---

## 2) What are the main goals of DevOps?

The main goals are faster delivery, improved collaboration, higher deployment frequency, lower failure rates, faster recovery, and better operational stability. DevOps aims to reduce friction between building software and running it in production.

---

## 3) What is CI/CD?

CI/CD stands for Continuous Integration and Continuous Delivery/Deployment. CI means frequently integrating code and running automated tests. CD means automatically delivering or deploying validated changes to environments, reducing manual release effort and risk.

---

## 4) What is the difference between Continuous Delivery and Continuous Deployment?

Continuous Delivery means code is always in a releasable state, but deployment to production may still require manual approval. Continuous Deployment goes further by automatically deploying every validated change to production without human intervention.

---

## 5) What is Infrastructure as Code (IaC)?

IaC means managing infrastructure through version-controlled code rather than manual setup. Tools like Terraform, CloudFormation, and Ansible allow repeatable, auditable, and scalable infrastructure provisioning and configuration.

---

## 6) Why is version control important in DevOps?

Version control provides traceability, collaboration, rollback capability, and auditability. It applies not only to application code but also to infrastructure, pipelines, and deployment manifests.

---

## 7) What is the role of automation in DevOps?

Automation reduces human error, increases repeatability, accelerates feedback, and improves scalability. Common automation areas include build, test, security scanning, deployment, infrastructure provisioning, and monitoring.

---

## 8) What is the DevOps pipeline?

The DevOps pipeline is the automated flow from code commit to production, often including build, test, security checks, artifact creation, deployment, and monitoring. Senior practitioners focus on reliability, observability, and fast feedback at every stage.

---

## 9) What are common DevOps metrics?

Important metrics include the DORA metrics:
- deployment frequency
- lead time for changes
- change failure rate
- mean time to recovery (MTTR)

These measure delivery speed and stability together.

---

## 10) What is the difference between monitoring and observability?

Monitoring tells you whether a known condition has occurred, while observability helps you understand unknown system behavior by analyzing logs, metrics, and traces. Observability is more about diagnosing why something happened.

---

## 11) What are logs, metrics, and traces?

- **Logs**: discrete event records
- **Metrics**: numeric time-series data
- **Traces**: end-to-end request flow across services

Together they provide a full picture of system health and behavior.

---

## 12) What is a blue-green deployment?

Blue-green deployment uses two production environments: one active and one idle. You deploy the new version to the idle environment, validate it, then switch traffic over. This minimizes downtime and allows quick rollback.

---

## 13) What is a canary deployment?

A canary deployment releases a new version to a small subset of users or traffic first. If the new version performs well, rollout continues gradually. This reduces blast radius and helps catch issues before full release.

---

## 14) What is rolling deployment?

A rolling deployment updates instances gradually in batches, replacing old versions with new ones while keeping the service available. It is common in container orchestration systems like Kubernetes.

---

## 15) What is a feature flag?

A feature flag is a runtime switch that enables or disables functionality without deploying new code. It supports safe releases, A/B testing, gradual rollouts, and quick rollback of features independently from deployments.

---

## 16) What is the role of incident management in DevOps?

Incident management focuses on restoring service quickly, minimizing user impact, and capturing lessons learned. It includes alerting, triage, escalation, communication, root cause analysis, and post-incident review.

---

## 17) What is the difference between SRE and DevOps?

DevOps is a broader culture and operating model centered on collaboration and automation. SRE is a more specific engineering discipline focused on reliability, SLOs, error budgets, and operational excellence. They overlap heavily in practice.

---

## 18) What are SLI, SLO, and SLA?

- **SLI**: Service Level Indicator — the measured metric
- **SLO**: Service Level Objective — the target
- **SLA**: Service Level Agreement — the contractual commitment

Senior teams use these to balance reliability and delivery speed.

---

## 19) What is the importance of security in DevOps?

Security must be built into the pipeline, not added at the end. DevSecOps includes secret scanning, dependency scanning, image scanning, policy enforcement, least privilege, and secure configuration to reduce risk early.

---

## 20) What are the biggest challenges in DevOps adoption?

Common challenges include cultural resistance, tool sprawl, inconsistent processes, lack of automation, poor communication, and unclear ownership. Successful DevOps adoption requires leadership support, incremental improvement, standardization, and strong engineering discipline.

---

If you want, I can also give you:
- **20 advanced DevOps questions**
- **DevOps interview questions focused on CI/CD, Kubernetes, Terraform, and observability**
- **a senior DevOps cheat sheet**
- **mock interview questions with ideal answers**
