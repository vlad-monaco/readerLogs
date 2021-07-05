FROM nginx

RUN apt-get update && apt-get install libgd-dev netcat -y

COPY conf /etc/nginx/
COPY entrypoint.sh /entrypoint.sh
COPY ssl /etc/nginx/ssl/keys/

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx"]
EXPOSE 443

