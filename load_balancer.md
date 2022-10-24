# LoadBalancer deployments

> kubectl create deployment balanced --image=docker.io/nginx:1.23
> kubectl expose deployment balanced --type=LoadBalancer --port=80

in new terminal
> minikube tunnel
> kubectl get services balanced
