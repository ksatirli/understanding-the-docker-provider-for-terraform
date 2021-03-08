provider "docker" {
  host = "unix:///var/run/docker.sock"

  //  registry_auth {
  //    address     = "registry.hub.docker.com"
  //    config_file = "${pathexpand("~/.docker/config.json")}"
  //  }
}
