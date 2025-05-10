FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
