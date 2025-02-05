terraform { 
  required_providers { 
    docker = { 
      source  = "kreuzwerker/docker" 
      version = "3.0.2" 
    } 
  } 
} 

provider "docker" { 
  host = "npipe:////./pipe/docker_engine" 
} 

resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "powershell.exe ./buildImg.ps1"
    working_dir = "${path.module}"
  }
}

resource "docker_image" "my_app" {
  name = "my-docker-app"
}

resource "docker_container" "my_container" {
  name = "my-container"
  image = docker_image.my_app.name
  must_run = true
}
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "web" {
  name         = "my-express-app"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "web" {
  name  = "my-express-container"
  image = docker_image.web.image_id
  ports {
    internal = 80
    external = 80
  }
}
