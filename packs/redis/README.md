# redis

Run a single Redis node

- [add this registry first](../../README.md#nomad-registry)

## Pack Usage

Create a variables file (optional)

```hcl
// redis.hcl
redis = {
  datacenters = ["dc1"]
  service_tags = ["traefik.enabled=false"]
  resources = {
    memory = 100
    cpu = 100
  }
}
```

Deploy redis

```sh
nomad-pack run redis --registry inveracity --var-file="./redis.hcl"
```

## Variables

- `datacenters` (list of strings) - A list of datacenters in the region which
  are eligible for task placement
- `service_tags` (list of string) - The consul service name for the redis
  application
- `resources` (object) - memory and cpu
