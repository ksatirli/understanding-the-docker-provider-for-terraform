resource "docker_container" "minecraft" {
  name  = "minecraft"
  image = docker_image.minecraft.latest

  // experiment by setting `command` and `entrypoint` to see
  // how Terraform's provisioning interacts with the container
  command    = []
  entrypoint = ["/minecraft/entrypoint.sh"]

  dns        = []
  dns_opts   = []
  dns_search = []

  ports {
    internal = var.minecraft_server_port
    external = var.minecraft_server_port
  }

  ports {
    internal = var.minecraft_rcon_port
    external = var.minecraft_rcon_port
  }

  privileged = false

  publish_all_ports = true

  volumes {
    // the `pathexpand` function allows Terraform to expand a path
    // in the same way you expect it to be expanded in your shell
    // see hashi.co/tf-pathexpand for more information
    host_path      = pathexpand("~/Sites/docker-data/minecraft-world")
    container_path = "/minecraft/world"
    read_only      = false
  }

  volumes {
    // experiment with the docker_volume.minecraft_config.name
    host_path      = pathexpand("~/Sites/docker-data/minecraft-config")
    container_path = "/minecraft/config"
    read_only      = false
  }

  volumes {
    host_path      = pathexpand("~/Sites/docker-data/minecraft-mods")
    container_path = "/minecraft/mods"
    read_only      = false
  }

  network_mode = docker_network.minecraft.driver

  env = [
    "WORLD_BACKUP=${var.minecraft_world_backup}",
    "MODS_BACKUP=${var.minecraft_mods_backup}",
    "RESOURCE_PACK=${var.minecraft_resource_pack}",
    "JAVA_MEMORY=${var.minecraft_java_memory}",
    "MINECRAFT_PORT=${var.minecraft_server_port}",
    "ALLOW_NETHER=${var.minecraft_allow_nether}",
    "MINECRAFT_MOTD=${var.minecraft_motd}",
    "RCON_PORT=${var.minecraft_rcon_port}",
    "RCON_ENABLED=${var.minecraft_rcon_enabled}",
    "RCON_PASSWORD=${var.minecraft_rcon_password}",
    "WHITELIST_ENABLED=${var.minecraft_whitelist_enabled}",

    "JAVA_BASE_URL=https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u252-b09/OpenJDK8U-jdk_",
    "JAVA_HOME=/usr/local/openjdk-8",
    "JAVA_URL_VERSION=8u252b09",
    "JAVA_VERSION=8u252",
    "LANG=C.UTF-8",
    "PATH=/usr/local/openjdk-8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  ]

  labels {
    label = "autoClean"
    value = "endOfDay"
  }

  // this is a legacy feature and may be removed from the Docker API
  // using this will result in a warning in the `plan` command output
  // links = []

  // experiment by turning these into variables and moving them
  // to `variables.tf`, followed by running `terraform plan`
  restart    = "on-failure"
  shm_size   = 64
  cpu_shares = 0

  working_dir = var.minecraft_working_dir

  // prevent container from saving logs
  logs = false

  // experiment by adding and removing container capabilities
  // see https://hashi.co/tf-docker-container-caps for docs
  // capabilities {}

  networks_advanced {
    name = docker_network.minecraft.name
  }

  sysctls = {}

  group_add = []

  lifecycle {

    // ignore changes for specific attributes
    ignore_changes = [
      hostname,
      labels,
      sysctls,
      group_add
    ]
  }
}

//networks = [docker_network.minecraft.name]
//docker_network.minecraft.name
