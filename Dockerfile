FROM nginx
# targe 为 nginx 镜像地址
ADD ./build/ /usr/share/nginx/html/
ADD nginx.conf /etc/nginx/
EXPOSE 80