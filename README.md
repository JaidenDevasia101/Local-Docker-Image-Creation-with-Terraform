# Terraform Local Docker Image

A Terraform configuration that **builds and manages a local Docker image** using the Docker CLI and Terraform.  
This setup is ideal for testing Docker builds with Terraform automation before pushing to a registry.

![Terraform](https://img.shields.io/badge/Terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-%232496ED.svg?style=for-the-badge&logo=docker&logoColor=white)

## What this Project Solves

Terraform’s Docker provider sometimes struggles with Windows paths and BuildKit when building locally.  
This configuration solves that by:

- Using Terraform to **orchestrate** the Docker build process
- Leveraging the Docker CLI for **reliable, BuildKit-enabled builds**
- Keeping the resulting image locally for immediate use or testing
- Providing a reproducible, infrastructure-as-code approach to Docker image creation

## Features

- **Local Image Build** — Fully automated local Docker image build from Terraform.
- **Build Arguments Support** — Pass build-time variables to the Dockerfile.
- **Cross-Platform Friendly** — Works on Windows, macOS, and Linux.
- **Keeps Image Locally** — No registry push required.
- **Terraform Outputs** — Automatically outputs the image ID after creation.

## Visual Mapping

Terraform `null_resource` → Docker CLI BuildKit → Local Docker Image Created  
              ↳ Terraform `data.docker_image` → Outputs Image ID

## Skills Demonstrated

- **Terraform + Docker Integration** — Using IaC to manage container builds.
- **Build Automation** — Reproducible builds with `docker build` triggered by Terraform.
- **Dockerfile Authoring** — Writing a minimal, functional Dockerfile with build args.
- **Terraform Data Sources** — Reading Docker image metadata after build.
- **Cross-Platform Development** — Handling Docker on Windows via `npipe`.

## Getting Started

### Prerequisites
- Terraform >= 1.6
- Docker Desktop installed and running
- Docker CLI in your system PATH (`docker ps` works in your terminal)

### Quick Deploy

```bash
git clone https://github.com/<your-username>/terraform-local-docker-image.git
cd terraform-local-docker-image

terraform init
terraform apply -auto-approve
