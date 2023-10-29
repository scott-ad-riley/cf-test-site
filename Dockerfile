FROM lucee/lucee:5.4-nginx

COPY config/nginx/ /etc/nginx/
COPY config/lucee/ /opt/lucee/
COPY www /var/www

RUN --mount=type=secret,id=LUCEE_ADMIN_PASSWORD \
  cat /run/secrets/LUCEE_ADMIN_PASSWORD > /opt/lucee/server/lucee-server/context/password.txt
