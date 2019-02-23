## Kube
    docker build . -t village-connect:1.0.0
    kubectl create -f blog-deployment.yml
    kubectl create -f blog-service.yml