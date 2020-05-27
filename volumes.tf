resource "docker_volume" "minecraft_world" {
  name   = "minecraft_world"
  driver = "local"

  // prevent destruction of the volume when you run `terraform destroy`
  lifecycle {
    prevent_destroy = true
  }
}

// experiment with this Volume by uncommenting it
// and replacing the `host_path` in `container.tf`
// with a reference to this Terraform resource
//resource "docker_volume" "minecraft_config" {
//  name   = "minecraft_config"
//  driver = "local"
//
//  lifecycle {
//    prevent_destroy = true
//  }
//}
