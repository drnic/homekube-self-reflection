# Self-reflection of #HomeKube

An app that allows guests to view your #homekube.

## Build image

I'm building the OCI (docker image) for this project using [Cloud Native Buildpack](https://buildpacks.io) `pack` CLI:

```plain
registry_org=docker.io/drnic
pack build --publish \
    --builder cloudfoundry/cnb:bionic \
    "$registry_org/homekube-self-reflection"
```

TODO: create multiarch image; as this only produces an `amd64` image.
