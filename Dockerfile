FROM odoo:17

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./addons /mnt/extra-addons

EXPOSE 8069

CMD ["odoo", "-c", "/etc/odoo/odoo.conf", "-i", "base,form_viewer"]
