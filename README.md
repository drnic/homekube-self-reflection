# Self-reflection of #HomeKube

An app that allows guests to view your #homekube.

## Install

The application requires access to some of the Kubernetes API.

Create a new serviceaccount, with a binding to a clusterrole allowing access to `nodes`:

```plain
kubectl create serviceaccount homekube-self-reflection
kubectl create clusterrole homekube:self-reflection \
    --verb=get,list,watch \
    --resource=nodes --resource=nodes/status
kubectl create clusterrolebinding homekube-self-reflection \
    --clusterrole=homekube:self-reflection \
    --serviceaccount=default:homekube-self-reflection
```

To run the application as a simple pod:

```plain
kubectl run --rm -i self-reflection \
    --generator=run-pod/v1 \
    --image docker.io/drnic/homekube-self-reflection \
    --image-pull-policy=Always \
    --serviceaccount homekube-self-reflection
```

## Build image

I'm using `docker buildx` to create multi-arch images so the image can run on Raspberry Pis (armv7), arm64, or common amd64 (Intel/AMD).

```plain
docker buildx build \
  --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \
  --tag docker.io/drnic/homekube-self-reflection \
  --push .
```
