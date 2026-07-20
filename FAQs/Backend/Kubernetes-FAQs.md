# Kubernetes FAQs

Senior-level Kubernetes interview FAQs with solid answers.

Here’s a compact tree of **Kubernetes architecture**:

```text
Kubernetes
├── Control Plane
│   ├── kube-apiserver
│   ├── etcd
│   ├── kube-scheduler
│   ├── kube-controller-manager
│   └── cloud-controller-manager
└── Worker Nodes
    ├── kubelet
    ├── kube-proxy
    ├── Container Runtime
    └── Pods
        ├── Containers
        └── Volumes
```

### Quick explanation
- **Control Plane**: manages cluster state and decisions
  - **kube-apiserver**: front door of the cluster
  - **etcd**: distributed key-value store for cluster data
  - **kube-scheduler**: assigns Pods to nodes
  - **kube-controller-manager**: runs controllers that keep the cluster in desired state
  - **cloud-controller-manager**: integrates with cloud provider resources

- **Worker Nodes**: run application workloads
  - **kubelet**: node agent that ensures containers are running
  - **kube-proxy**: handles networking/service rules
  - **Container runtime**: runs containers, e.g. containerd or CRI-O
  - **Pods**: smallest deployable unit

If you want, I can also give you:
1. a **more detailed tree** including Services, Ingress, CNI, CSI, and DNS, or
2. a **diagram-style ASCII view** of how traffic flows through Kubernetes.

Helm and Argo CD are **not core Kubernetes components**. They sit **on top of Kubernetes** in the **deployment / application management layer**.

```text
Kubernetes Ecosystem
├── Kubernetes Core
│   ├── Control Plane
│   └── Worker Nodes
├── Package / Release Management
│   └── Helm
└── GitOps / Continuous Delivery
    └── Argo CD
```

### Where they fit

- **Helm**
  - A **package manager for Kubernetes**
  - Used to **template and install** Kubernetes manifests
  - Usually runs as a **client-side tool** or via CI/CD pipelines
  - Think of it as: “build and install app bundles into Kubernetes”

- **Argo CD**
  - A **GitOps continuous delivery tool**
  - Runs **inside Kubernetes** and watches Git repositories
  - Syncs cluster state to match what’s declared in Git
  - Think of it as: “keep Kubernetes in sync with Git”

### Relationship to Kubernetes
- Kubernetes provides the **runtime and reconciliation platform**
- Helm helps you **generate and deploy** resources
- Argo CD helps you **continuously apply** desired state from Git

### Simplified mental model
- **Kubernetes** = the engine
- **Helm** = the packaging/install tool
- **Argo CD** = the Git-driven delivery controller

If you want, I can draw a **full tree including Helm, Argo CD, Ingress, CNI, CSI, and observability tools**.

---

## 1) What problem does Kubernetes solve?

Kubernetes automates deployment, scaling, load balancing, self-healing, and service discovery for containerized applications. It abstracts away individual machines and lets you manage applications as desired state rather than manual host-by-host operations.

---

## 2) What is the Kubernetes control plane?

The control plane manages the cluster’s desired state. Its main components are the API server, scheduler, controller manager, and etcd. The API server is the front door, the scheduler assigns pods to nodes, controllers reconcile state, and etcd stores cluster data.

---

## 3) What is etcd and why is it critical?

etcd is a distributed key-value store used as Kubernetes’ source of truth. It stores cluster state, configuration, and metadata. If etcd is unhealthy or unavailable, the cluster can lose its ability to make scheduling and reconciliation decisions, so backups and disaster recovery are essential.

---

## 4) What is the difference between a Pod and a container?

A container runs a single application process, while a Pod is the smallest deployable Kubernetes unit and can contain one or more tightly coupled containers sharing network and storage. Pods are the scheduling and networking boundary in Kubernetes.

---

## 5) What is the difference between a Deployment, ReplicaSet, and Pod?

A Pod is the runtime unit, a ReplicaSet ensures a desired number of Pod replicas exist, and a Deployment manages ReplicaSets and provides rollout/rollback capabilities. In practice, you usually create Deployments rather than managing ReplicaSets directly.

---

## 6) What is the difference between a Service and an Ingress?

A Service provides stable networking to a set of Pods inside the cluster and can expose them internally or externally. Ingress is an HTTP/HTTPS routing layer that manages external access to Services, typically using an ingress controller.

---

## 7) What are the main Service types in Kubernetes?

The common types are:
- **ClusterIP**: internal-only access
- **NodePort**: exposes a port on each node
- **LoadBalancer**: provisions an external load balancer
- **ExternalName**: maps a service to a DNS name

Senior engineers should know when to use each based on traffic pattern and infrastructure.

---

## 8) How does Kubernetes scheduling work?

The scheduler assigns Pods to nodes based on resource requests, constraints, affinities, taints/tolerations, topology, and policy. It tries to find the best-fit node while respecting hard constraints and optimizing cluster usage.

---

## 9) What are requests and limits?

Resource requests define the minimum CPU/memory a Pod needs for scheduling. Limits define the maximum resources it can use. Requests affect placement; limits affect runtime enforcement. Proper tuning prevents contention and helps cluster stability.

---

## 10) What are readiness, liveness, and startup probes?

- **Readiness probe**: determines if the Pod can receive traffic
- **Liveness probe**: determines if the container should be restarted
- **Startup probe**: allows slow-starting apps time to initialize

Using them correctly improves reliability and avoids traffic being routed to unhealthy Pods.

---

## 11) What is a ConfigMap and when should you use it?

A ConfigMap stores non-sensitive configuration data such as environment variables, configuration files, or feature flags. It separates config from images, making deployments more portable and easier to manage.

---

## 12) What is a Secret and how is it different from a ConfigMap?

A Secret stores sensitive data like passwords, tokens, and certificates. It is similar to a ConfigMap but intended for confidential information. Senior engineers should also understand that Kubernetes Secrets are not automatically secure unless encryption at rest, RBAC, and proper external secret management are in place.

---

## 13) What is a Namespace?

A Namespace provides logical isolation within a cluster. It helps organize resources, manage access control, and separate environments or teams. It is not strong security isolation by itself, but it is useful for scoping resources and policies.

---

## 14) What are taints and tolerations?

Taints repel Pods from nodes unless the Pods have matching tolerations. They are used to reserve nodes for special workloads, isolate critical workloads, or prevent general scheduling on certain nodes.

---

## 15) What are node affinity and pod affinity/anti-affinity?

- **Node affinity**: schedule Pods on nodes matching labels
- **Pod affinity**: schedule Pods near other Pods
- **Pod anti-affinity**: spread Pods apart from each other

These are used for performance, availability, and placement control.

---

## 16) How does Kubernetes handle self-healing?

Kubernetes continuously reconciles desired state. If a Pod crashes, the controller recreates it. If a node fails, Pods are rescheduled elsewhere. If a Deployment’s state changes, Kubernetes gradually rolls out the new version. This reconciliation loop is one of Kubernetes’ core strengths.

---

## 17) What is rolling update and rollback?

A rolling update replaces old Pods gradually with new ones, minimizing downtime. Rollback lets you revert to a previous revision if the new deployment is unhealthy. Deployments support both capabilities natively.

---

## 18) How do you debug a failing Pod?

Typical steps:
1. Check `kubectl get pods` and Pod status
2. Inspect events with `kubectl describe pod`
3. Review logs with `kubectl logs`
4. Check readiness/liveness probe failures
5. Verify image, env vars, volumes, and permissions
6. Use an ephemeral debug container if needed

Senior troubleshooting usually involves correlating events, logs, and resource constraints.

---

## 19) What is the difference between DaemonSet, StatefulSet, and Deployment?

- **Deployment**: stateless, scalable app replicas
- **StatefulSet**: stable identity, stable storage, ordered rollout for stateful apps
- **DaemonSet**: runs one Pod per node, often for logging, monitoring, or networking agents

These controllers solve different workload patterns.

---

## 20) What are common production best practices for Kubernetes?

Some key best practices are:
- define resource requests and limits
- use readiness/liveness/startup probes
- separate config and secrets
- apply RBAC least privilege
- use namespaces and network policies
- store manifests in Git
- monitor cluster and workload health
- back up etcd and critical data
- use PodDisruptionBudgets where appropriate
- design for statelessness where possible

---

If you want, I can also provide:
- **20 more advanced Kubernetes questions**
- **Kubernetes troubleshooting interview FAQs**
- **Kubernetes + Helm + ArgoCD senior interview set**
- **a senior DevOps interview pack covering Docker, Kubernetes, Terraform, and CI/CD**
