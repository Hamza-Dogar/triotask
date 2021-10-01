docker network create trio-task-network
docker build -t trio-db db
docker build -t trio-flask-app flask-app
docker run -d --network trio-task-network --name flask-app trio-flask-app
docker run -d --network trio-task-network --mount type=bind,source=$(pwd)/nginx/nginx.conf,target=/etc/nginx/nginx.conf -p 80:80 --name nginx nginx:alpine
docker ps -a