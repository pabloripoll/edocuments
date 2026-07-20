# Docker FAQs

Senior-level Docker interview FAQs with concise but strong answers.

---

## 1) What problem does Docker solve?

Docker solves the “works on my machine” problem by packaging an application and its dependencies into a portable container. It provides consistency across development, testing, and production environments while improving isolation and deployment speed.

---

## 2) What is the difference between a container and a virtual machine?

A virtual machine virtualizes hardware and runs a full guest OS, while a container shares the host kernel and isolates processes at the OS level. Containers are lighter, start faster, and use fewer resources than VMs, but VMs provide stronger isolation boundaries in some cases.

---

## 3) What is a Docker image?

A Docker image is a read-only template used to create containers. It contains the application code, runtime, libraries, environment variables, and filesystem layers needed to run the app. Images are built from a Dockerfile and stored in registries.

---

## 4) What is a Docker container?

A Docker container is a running instance of an image. It is an isolated process with its own filesystem, network, and runtime environment, but it still shares the host kernel.

---

## 5) What is the difference between an image and a container?

An image is static and immutable; a container is a runtime instance of that image. You can create many containers from one image, and containers can add a writable layer on top of the image filesystem.

---

## 6) What is a Dockerfile?

A Dockerfile is a text file containing instructions to build a Docker image. It defines the base image, copies files, installs dependencies, sets environment variables, exposes ports, and specifies the default command.

---

## 7) How do Docker image layers work?

Each Dockerfile instruction typically creates a new layer. Layers are cached and reused when possible, which speeds up builds. Understanding layer ordering is important for build performance and caching efficiency.

---

## 8) What is the difference between `CMD` and `ENTRYPOINT`?

`CMD` provides default arguments or the default command that can be overridden at runtime. `ENTRYPOINT` defines the main executable that should always run. Senior usage often combines them: `ENTRYPOINT` for the executable and `CMD` for default parameters.

---

## 9) What is the difference between `COPY` and `ADD`?

`COPY` simply copies files from the build context into the image. `ADD` can also fetch remote URLs and automatically extract tar archives. Best practice is to use `COPY` unless you specifically need `ADD`’s extra features.

---

## 10) What is Docker Compose used for?

Docker Compose is used to define and run multi-container applications. It lets you declare services, networks, volumes, and environment settings in a YAML file. It is especially useful for local development and integration testing.

---

## 11) How do Docker volumes differ from bind mounts?

A bind mount maps a file or directory from the host into the container. A volume is managed by Docker and stored in Docker’s data area. Volumes are generally preferred for persistence in production because they are more portable and easier to manage.

---

## 12) What are best practices for writing Dockerfiles?

Good practices include:
- using small base images
- minimizing layers
- ordering instructions for caching
- using `.dockerignore`
- running as a non-root user
- pinning image versions
- removing build dependencies in final images
- separating build and runtime stages with multi-stage builds

---

## 13) What is a multi-stage build?

A multi-stage build uses multiple `FROM` statements to separate build-time and runtime environments. You can compile in one stage and copy only the final artifacts into a smaller runtime image. This reduces image size and attack surface.

---

## 14) How do you optimize Docker image size?

You can reduce image size by:
- choosing slim or alpine base images when appropriate
- using multi-stage builds
- removing cache and temporary files
- combining commands where sensible
- avoiding unnecessary dependencies
- copying only required files
- using `.dockerignore`

---

## 15) What is the Docker build cache?

Docker caches build layers so unchanged steps do not need to run again. If a layer’s inputs change, that layer and subsequent layers must be rebuilt. Proper Dockerfile ordering can significantly improve build times.

---

## 16) How do you troubleshoot a container that exits immediately?

Typical checks:
1. inspect logs with `docker logs`
2. run the container interactively with a shell
3. verify the command/entrypoint
4. check missing env vars or config
5. confirm the application is not crashing on startup
6. inspect exit codes and resource limits

Senior debugging usually starts with the container logs and runtime command.

---

## 17) What is Docker networking?

Docker networking allows containers to communicate with each other, the host, and external networks. Common drivers include bridge, host, none, and overlay. In Compose and Swarm environments, networking becomes essential for service discovery and connectivity.

---

## 18) How should secrets be handled in Docker?

Secrets should not be baked into images or committed to source control. Use environment injection, Docker secrets, secret managers, or orchestrator-native mechanisms like Kubernetes Secrets or cloud secret stores. Treat image layers as immutable and potentially inspectable.

---

## 19) What are common security concerns with Docker?

Key concerns include running containers as root, using untrusted images, leaking secrets, over-permissive capabilities, insecure networking, and outdated base images. Good practices include image scanning, least privilege, rootless containers when possible, and minimal base images.

---

## 20) When would you choose Docker over a full VM?

Choose Docker when you want lightweight packaging, fast startup, portability, and higher density for applications. Choose VMs when you need stronger isolation, different kernels, or full OS-level separation. In many enterprise environments, Docker and VMs are used together.

---

If you want, I can also provide:
- **20 more advanced Docker questions**
- **Docker + Kubernetes senior interview pack**
- **Dockerfile best-practices cheat sheet**
- **a combined DevOps senior interview set for Docker, Kubernetes, Terraform, and CI/CD**
