// retrieve metadata of an image for use downstream
data "docker_registry_image" "minecraft" {
  name = local.image
}

resource "docker_image" "minecraft" {
  name         = local.image
  keep_locally = true

  // setting `pull_triggers` to a the below data source will automatically pull
  // a new version of the image if the SHA256 digest for this image changes upstream

  // experiment with this by publishing a new version of an image you control
  pull_triggers = [data.docker_registry_image.minecraft.sha256_digest]
}
