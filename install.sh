#!/bin/bash

sudo mkdir -p /home/$USER/minikube/DOCS
sudo cp *md /home/$USER/minikube/DOCS

sed "s/minikubeuser/$USER/" services/minikube.service |sudo tee /usr/lib/systemd/system/minikube.service &>/dev/null
sed "s/minikubeuser/$USER/" services/minikube-dashboard.service |sudo tee /usr/lib/systemd/system/minikube-dashboard.service &>/dev/null
sed "s/minikubeuser/$USER/" services/minikube-proxy.service |sudo tee /usr/lib/systemd/system/minikube-proxy.service &>/dev/null 

echo "reloading systemctl daemon"
sudo systemctl daemon-reload
# sudo systemctl enable minikube.service 
# sudo systemctl enable minikube-dashboard.service 
# sudo systemctl enable minikube-proxy.service
echo "starting MINIKUBE"
sudo systemctl start minikube.service 
echo "starting MINIKUBE dashboard"
sudo systemctl start minikube-dashboard.service 
echo "starting MINIKUBE proxy"
sudo systemctl start minikube-proxy.service


# @TODO await services start and minikube up and running
echo "Awaiting minikube start !!"
while [ ! -f ~/.minikube/ca.crt ];
do
    sleep 1
done
