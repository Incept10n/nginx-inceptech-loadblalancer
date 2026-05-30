FROM nginx:stable-alpine3.23-perl

RUN rm -rf /etc/nginx/conf.d/* && mkdir -p /etc/nginx/stream.d

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/ /etc/nginx/conf.d/
COPY stream.d/ /etc/nginx/stream.d/

RUN nginx -t

EXPOSE 80 443 1936

CMD ["nginx", "-g", "daemon off;"]
