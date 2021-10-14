docker build -t zgodwin1/multi-client:latest -t zgodwin1/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t zgodwin1/multi-server:latest -t zgodwin1/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t zgodwin1/multi-worker:latest -t zgodwin1/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push zgodwin1/multi-client
docker push zgodwin1/multi-server
docker push zgodwin1/multi-worker
kubectl apply -f k8s
kuectl set image deployments/server-deployment/multi-server