

## React Development Environment in Minikube

### Prerequisite
- node and npm
- docker desktop
- minikube
- kubectl
- skaffold

### Deploy to k8s
```bash
# switch to minikube docker dameon
eval $(minikube -p minikube docker-env)
# build react dev image
docker build -f Dockerfile.dev -t simple-app-dev
# deploy react to pods
kubectl apply -f k8s/deployment.yaml
# deploy node port service
kubectl apply -f k8s/nodePort.yaml
# expose port to host machine
minikube service simple-app-node-port
```

### Hot Reload with Skaffold
- will only sync files without rebuild image.
```bash
scaffold dev
```
