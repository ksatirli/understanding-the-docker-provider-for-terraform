# Understanding the Docker Provider for Terraform

> Reading material and code examples

## Table of Contents

- [Understanding the Docker Provider for Terraform](#understanding-the-docker-provider-for-terraform)
  - [Table of Contents](#table-of-contents)
  - [Important Links](#important-links)
  - [Reading material](#reading-material)
    - [HashiCorp Configuration Language](#hashicorp-configuration-language)
    - [Docker Provider for Terraform](#docker-provider-for-terraform)
    - [Code Quality](#code-quality)
    - [Visualizing resources](#visualizing-resources)
    - [Importing resources](#importing-resources)
    - [Modules](#modules)
  - [Author Information](#author-information)
  - [License](#license)

## Important Links

* Slides: [speakerdeck.com/ksatirli/understanding-the-docker-provider-for-terraform](https://speakerdeck.com/ksatirli/understanding-the-docker-provider-for-terraform)
* Code: [github.com/ksatirli/understanding-the-docker-provider-for-terraform](https://github.com/ksatirli/understanding-the-docker-provider-for-terraform)

## Reading material

This section is a collection of links that will help you make the most of today's session.

### HashiCorp Configuration Language

* repository: [hashicorp/hcl](https://github.com/hashicorp/hcl/tree/hcl2)

## Terraform Basics

* CLI commands [terraform.io/docs/commands/index.html](https://www.terraform.io/docs/commands/index.html)
* variables and type constraints: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#type-constraints)
* variable definition files: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* information about Terraform State: [terraform.io/docs/state/index.html](https://www.terraform.io/docs/state/index.html)

### Docker Provider for Terraform

* ChangeLog on [GitHub](https://github.com/terraform-providers/terraform-provider-docker/blob/master/CHANGELOG.md)
* documentation:
  * for the provider can be found on [terraform.io/docs/providers/docker](https://www.terraform.io/docs/providers/docker/index.html)
  * for the `docker_registry_image` data source can be found on [terraform.io/docs/providers/docker/d/registry_image.html](https://www.terraform.io/docs/providers/docker/d/registry_image.html)
  * for the `docker_container` resource can be found on [terraform.io/docs/providers/docker/r/container.html](https://www.terraform.io/docs/providers/docker/r/container.html)
  * for the `docker_image` resource can be found on [terraform.io/docs/providers/docker/r/image.html](https://www.terraform.io/docs/providers/docker/r/image.html)
  * for the `docker_network` resource can be found on [terraform.io/docs/providers/docker/r/network.html](https://www.terraform.io/docs/providers/docker/r/network.html)
  * for the `docker_volume` resource can be found on [terraform.io/docs/providers/docker/r/volume.html](https://www.terraform.io/docs/providers/docker/r/volume.html)

### Code Quality

Before `plan` and `apply`, always clean up your code:

* use [terraform fmt](https://www.terraform.io/docs/commands/fmt.html) to rewrite Terraform configuration files to a canonical format and style.
* use [terraform validate](https://www.terraform.io/docs/commands/validate.html) to validate the configuration syntax and internal consistency
* use [pre-commit](https://pre-commit.com) to run more checks
  * community member [@antonbabenko/](https://github.com/antonbabenko/) built and maintains [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform)

## Author Information

This repository is maintained by [Kerim Satirli](https://github.com/ksatirli).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
