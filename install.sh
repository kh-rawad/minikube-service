#!/bin/bash

sudo useradd --system -m -d /opt/minikube minikube
sudo mkdir -p /opt/minikube/DOCS
sudo cp *md /opt/minikube/DOCS

sudo chown minikube:minikube /opt/minikube/ -R
sudo chmod g+w /opt/minikube/ -R
sudo usermod -aG minikube $USER
sudo usermod -aG docker minikube

sudo cp services/minikube.service /usr/lib/systemd/system/minikube.service
sudo cp services/minikube-dashboard.service /usr/lib/systemd/system/minikube-dashboard.service
sudo cp services/minikube-proxy.service /usr/lib/systemd/system/minikube-proxy.service

sudo systemctl daemon-reload
sudo systemctl enable minikube.service 
sudo systemctl enable minikube-dashboard.service 
sudo systemctl enable minikube-proxy.service

sudo systemctl start minikube.service 
sudo systemctl start minikube-dashboard.service 
sudo systemctl start minikube-proxy.service


# @TODO await services start and minikube up and running
while [ ! -f /opt/minikube/.minikube/ca.crt ];
do
    sleep 1
done

#######################################################
mkdir ~/.minikube_service
sudo cp /opt/minikube/.minikube/ca.crt ~/.minikube_service/
sudo cp /opt/minikube/.minikube/profiles/minikube/client.crt ~/.minikube_service/
sudo cp /opt/minikube/.minikube/profiles/minikube/client.key ~/.minikube_service/

sudo chown -R $USER $HOME/.minikube_service; chmod -R u+wrx $HOME/.minikube_service
cp kube_config.yaml ~/.kube/config
