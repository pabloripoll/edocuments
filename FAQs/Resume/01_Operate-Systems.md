## What is Linux?
Linux is an open source operating system (OS) software that directly manages a system’s hardware and physical resources, like CPU, memory, and storage through many small programs called kernel.

The **Kernel** is a computer program at the core of a computer's operating system and has complete control over everything in the computer and peripherals. Thus, computer’s memory is divided into two system spaces: Kernel Space and User Space.

The **System Kernel Space** is the portion of the operating system code that performs hardware processes assigning CPU and memory resources for the system itself and each applications components. These system’s processes are not visible neither accessible to the end user.

The **System User Space** is the administrative layer for system-level tasks accessible to the end user like system configuration and software applications at the server or desktop environment.

## Desktop

## Servers

### What is a web server platform
A web server platform is and the second component *(like Apache, Haproxy or Nginx)* that is needed in a web application stack to deliver web content. It handles all requests made to a configured server port (commonly 80 is opened to the internet), checking if a request is valid, it will serves back the applications assets or content via HTTP. This is known as classic or forward proxy.

In the other hand, Apache/Nginx can be used to pass all the requests to another internal port in which another server platform is listening to handle requests, knowing this as reverse proxy.

Also, the forward proxy can be used to maximize server performance by storing the information served on last request, known as caching, or as a load balance, routing client requests across another configured servers capable of fulfilling those requests maximizing speed and capacity utilization, ensuring that no one server is overworked.

## Isolated Enviroment

It is devided in two main technologies virtualization and containeration

**Windows Hyper-V Virtual Machine Tutorial:** https://www.youtube.com/watch?v=3I64TeJ4iNI

**Virtual Machines vs Containers:** https://www.youtube.com/watch?v=eyNBf1sqdBQ

**Big Misconceptions about Bare Metal, Virtual Machines, and Containers** https://www.youtube.com/watch?v=Jz8Gs4UHTO8

Bare Metal Hardware:

Virtual Machine / Bare Metal Hipervisor:

Container:

#### Never install locally, there's a better way
https://www.youtube.com/watch?v=J0NuOlA2xDc

### Virtual Machine
Consume more RAM

Most common virtual machien: Hyper-V,VMware ESXi

### Container
Consume less RAM

Most common container platforms: Docker, LXD, Podman.

# Operate Systems

## General Porpuse Operate System - GPOS
Linux, Wondows, MacOS.

## Real Time Operate System - RTOS
Divice drivers. ESP32

#### Introduction to RTOS Part 1/2 - What is a Real-Time Operating System (RTOS)? | Digi-Key Electronics
https://www.youtube.com/watch?v=F321087yYy4 \
https://www.youtube.com/watch?v=JIr7Xm_riRs

#### What is Docker?
Docker is a set of platform as a service software by virtualizing the operating system of the computer on which it is installed and running, to deliver software images in packages called containers, simplifying the process of building, running, managing and distributing applications in any operate system environment.