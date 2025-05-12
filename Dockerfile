FROM odoo:17

COPY ./addons /mnt/extra-addons

EXPOSE 8069

CMD ["odoo", "-c", "/etc/secrets/odoo.conf"]