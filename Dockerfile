FROM nginx
RUN apt update -y && apt upgrade -y && apt install vim -y
RUN mkdir -p /var/html/page1 && mkdir -p /var/html/page2
RUN rm -f /etc/nginx/conf.d/default.conf
COPY index80.html /var/html/page1/index.html 
COPY index3000.html /var/html/page2/index.html
COPY page1.conf /etc/nginx/conf.d/page1.conf
COPY page2.conf /etc/nginx/conf.d/page2.conf
EXPOSE 80 3000
