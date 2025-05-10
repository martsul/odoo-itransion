#!/bin/bash

ODOO_DB_NAME=${DB_NAME:-odoo_db}
ODOO_DB_USER=${DB_USER:-odoo_user}
ODOO_DB_PASSWORD=${DB_PASSWORD:-odoo_pass}
ODOO_DB_HOST=${DB_HOST:-postgres}
ODOO_DB_PORT=${DB_PORT:-5432}

TABLE_COUNT=$(psql -h "$ODOO_DB_HOST" -U "$ODOO_DB_USER" -d "$ODOO_DB_NAME" -tAc "SELECT count(*) FROM information_schema.tables WHERE table_schema='public';")

if [ "$TABLE_COUNT" -eq "0" ]; then
    echo ">> Initial DB..."
    exec odoo -i base --config=/etc/odoo/odoo.conf
else
    echo ">> DB Was Founded..."
    exec odoo --config=/etc/odoo/odoo.conf
fi
