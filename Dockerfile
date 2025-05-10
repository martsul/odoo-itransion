FROM odoo:17

COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf
