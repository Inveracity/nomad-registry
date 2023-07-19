job "redis" {
  datacenters = [[ .redis.datacenters  | toStringList ]]
  type = "service"

  group "redis" {
    count = 1

    network {
      port "redis" {
        static = 6379
      }
    }

    service {
      name     = "redis"
      provider = "nomad"
      port     = "redis"
      tags     = [[ .redis.service_tags | toStringList ]]
    }

    task "redis" {
      driver = "docker"

      config {
        image = "redis:7-alpine"
        ports = ["redis"]
        args  = ["--appendonly", "yes"]
      }

      resources {
        cpu    = [[ .redis.resources.cpu ]]
        memory = [[ .redis.resources.memory ]]
      }
    }
  }
}
