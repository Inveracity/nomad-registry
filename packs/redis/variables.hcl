# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "datacenters" {
  description = "A list of datacenters in the region which are eligible for task placement"
  type        = list(string)
  default     = ["dc1"]
}

variable "service_tags" {
  description = "The consul service name for the redis application"
  type        = list(string)
  default = [
    "traefik.enable=false",
  ]
}

variable "resources" {
  description = "The resources to assign to the application."
  type = object({
    cpu    = number
    memory = number
  })
  default = {
    cpu    = 100,
    memory = 100
  }
}
