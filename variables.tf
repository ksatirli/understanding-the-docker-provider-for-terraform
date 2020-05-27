variable "image_name" {
  type        = string
  description = "Organization and Name of Docker Image"
}

variable "image_tag" {
  type        = string
  description = "Tag of Docker Image"
}

variable "network_name" {
  type        = string
  description = "Name of Docker Network"
  default     = "minecraft-net"
}

variable "minecraft_world_backup" {
  type        = string
  description = "World Backup file for Minecraft Server"
}

variable "minecraft_mods_backup" {
  type        = string
  description = "Mods Backup file for Minecraft Server"
}

variable "minecraft_resource_pack" {
  type        = string
  description = "Resource Pack file for Minecraft Server"
}

variable "minecraft_java_memory" {
  type        = string
  description = "Amount of Memory to allocate for Minecraft Server"
  default     = "1G"
}

variable "minecraft_server_port" {
  type        = number
  description = "Port for Minecraft Server"
}

variable "minecraft_allow_nether" {
  type        = bool
  description = "Boolean to enable Nether Underworld for Minecraft server"
}

variable "minecraft_motd" {
  type        = string
  description = "MOTD for Minecraft server"
}

variable "minecraft_rcon_port" {
  type        = number
  description = "RCON Port for Minecraft Server"
}

variable "minecraft_rcon_enabled" {
  type        = bool
  description = "Boolean to enable RCON for Minecraft server"
}

// experiment with this value by replacing it with something more secure
// and less hardcoded, by trying the `vault_generic_secret` resource
// more information can be found on hashi.co/vault-generic-secret-for-tf
variable "minecraft_rcon_password" {
  type        = string
  description = "RCON Password for Minecraft server"
}

variable "minecraft_whitelist_enabled" {
  type        = bool
  description = "Boolean to enable RCON Whitelist for Minecraft server"
}

variable "minecraft_working_dir" {
  type        = string
  description = "Working Directory for Minecraft Server"
  default     = "/minecraft"
}

// local variables allow for interpolation
locals {
  // combine image name and tag into a single variable for ease of use
  image = "${var.image_name}:${var.image_tag}"
}
