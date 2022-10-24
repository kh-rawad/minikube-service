# minikuse install

```/bin/bash
curl -LO <https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64>
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

## Start your cluster

> minikube start

## Interact with your cluster

If you have **kubectl** installed
>kubectl get po -A

you can use ***kubectl*** from ***minikube***
> minikube kubectl -- get po -A

OR add alias to ***.bashrc***
> alias kubectl="minikube kubectl --"

*** Finally run the dashboard
> minikube dashboard
