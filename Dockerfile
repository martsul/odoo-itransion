FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh

USER root
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
