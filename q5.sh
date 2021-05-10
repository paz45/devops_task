#!/bin/sh
sudo docker run -d --name nginx -p 5000:80 paz45/nginx
sudo docker run -d --name flask -p 80:80 paz45/flask
http_code=$(curl -LI http://0.0.0.0:5000 -o /dev/null -w '%{http_code}\n' -s)
if [ ${http_code} -eq 200 ]; then
    echo 'OK'
fi