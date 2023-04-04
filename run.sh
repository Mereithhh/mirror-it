#!/bin/sh
echo "ENABLE_AUTH" ${ENABLE_AUTH}
echo "USER" ${USER}
echo "PASSWORD" ${PASSWORD}
echo "SITE" ${SITE}
if [ "${ENABLE_AUTH}" = "true" ]; then
    echo "Enabling authentication"
    cp /etc/caddy/CaddyfileAuth /etc/caddy/Caddyfile
    caddy hash-password --plaintext ${PASSWORD} > /etc/caddy/passwd
    cat /etc/caddy/passwd
    sed -i "s/USER/${USER}/g" /etc/caddy/Caddyfile
    passwd=$(cat /etc/caddy/passwd)
    sed -i "s~PASSWORD~${passwd}~g" /etc/caddy/Caddyfile
    sed -i "s#SITE#${SITE}#g" /etc/caddy/Caddyfile
else
    echo "Disabling authentication"
    cp /etc/caddy/CaddyfileNoAuth /etc/caddy/Caddyfile
    sed -i "s#SITE#${SITE}#g" /etc/caddy/Caddyfile
fi
cat /etc/caddy/Caddyfile
caddy run --config /etc/caddy/Caddyfile