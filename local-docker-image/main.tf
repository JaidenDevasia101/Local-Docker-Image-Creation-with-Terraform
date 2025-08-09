terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"  # Windows Docker Desktop
}

# 1) Build the image with Docker CLI (uses BuildKit)
resource "null_resource" "build_image" {
  provisioner "local-exec" {
    command = "docker build -t my-app:latest --build-arg APP_ENV=prod ."
    environment = {
      DOCKER_BUILDKIT = "1"
    }
  }
}

# 2) Read the image metadata after the build
data "docker_image" "app" {
  depends_on = [null_resource.build_image]
  name       = "my-app:latest"
}

output "built_image_id" {
  value = data.docker_image.app.id
}
