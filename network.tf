// creates a simple (bridged) network for the server
// see https://hashi.co/3cbQMcV for more information
resource "docker_network" "minecraft" {
  name            = var.network_name
  check_duplicate = true
  driver          = "bridge"
  options         = {}
}
