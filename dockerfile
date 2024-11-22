FROM nginx:latest

workdir /app

COPY build/ /usr/share/nginx/html


Expose 80

CMD ["nginx", "-g", "daemon off;"]
