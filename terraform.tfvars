image_name = "hashicraft/minecraft"

// apply the `v1.16.4` value by running:
// terraform plan -out="docker.tfplan"
// terraform apply "docker.tfplan"
//
// when successful, experiment by changing
// the value below from "v1.16.4" to "latest"
// and then re-apply the changes by running:
//
// terraform plan -out="docker.tfplan"
// terraform apply "docker.tfplan"
// again
image_tag = "v1.16.4"

minecraft_world_backup  = "https://git.io/Jfrmv"
minecraft_mods_backup   = "https://git.io/Jfrm9"
minecraft_resource_pack = "https://git.io/JfrmH"

// enabling this will override the default value, specified in variables.tf
//minecraft_java_memory = "1G"

minecraft_server_port   = 25565
minecraft_allow_nether  = true
minecraft_motd          = "Hello, London"
minecraft_rcon_port     = 27015
minecraft_rcon_enabled  = true
minecraft_rcon_password = "hashicraft"

// enabling the whitelist requires adding your identifier by editing
// `whitelist.json` or use a RCON terminal: `whitelist add <USERNAME>`
minecraft_whitelist_enabled = false
