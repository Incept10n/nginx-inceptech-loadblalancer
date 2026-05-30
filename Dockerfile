FROM nginx:stable-alpine3.23-perl

RUN rm -rf /etc/nginx/conf.d/* && mkdir -p /etc/nginx/stream.d

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/ /etc/nginx/conf.d/
COPY stream.d/ /etc/nginx/stream.d/

# i disabled nginx -t check just to nginx build with non existent ssl certs because they mount via k8s secrets into container

EXPOSE 80 443 1936

CMD ["nginx", "-g", "daemon off;"]
