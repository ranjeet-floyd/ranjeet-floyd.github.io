# Go to google console 
    https://console.cloud.google.com/kubernetes/deployment/asia-east2-c/village-connect-blog/default/village-connect?project=village-232610&authuser=1&tab=overview&deployment_overview_active_revisions_tablesize=50&duration=PT1H&pod_summary_list_tablesize=20&service_list_datatablesize=20

export PROJECT_ID="$(gcloud config get-value project -q)"

docker build -t gcr.io/${PROJECT_ID}/village-connect:v1 .

docker images

gcloud auth configure-docker

docker push gcr.io/${PROJECT_ID}/village-connect:v1
## Run the following command to deploy your application, listening on port 80:
kubectl run village-connect --image=gcr.io/${PROJECT_ID}/village-connect:v1 --port 80

## Get pods
kubectl get pods

# Expose to internet
    kubectl expose deployment village-connect --type=LoadBalancer --port 80 --target-port 80

# check external IP
    kubectl get service

# Scale up your application
    kubectl scale deployment village-connect --replicas=3
    kubectl get deployment village-connect

# Delete 
    kubectl delete service village-connect
    gcloud container clusters delete <cluster-name>