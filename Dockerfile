FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "-i", "base"]
