# Deploy application to cluster

application name **hello-minikube** with the image **nginx** ver 1.23
> kubectl create deployment hello-minikube --image=docker.io/nginx:1.23
>kubectl expose deployment hello-minikube --type=NodePort --port=80

check running app
> kubectl get services hello-minikube

launch web browser
> minikube service hello-minikube

port forward to <http://localhost:7080/>
> kubectl port-forward service/hello-minikube 7080:80
