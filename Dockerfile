FROM caddy
WORKDIR /
COPY ./CaddyfileNoAuth /etc/caddy/CaddyfileNoAuth
COPY ./CaddyfileAuth /etc/caddy/CaddyfileAuth
COPY ./run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 888
CMD ["/run.sh"]