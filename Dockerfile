FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

ENV PORT=80

EXPOSE 80

CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "--http-port=80"]
