#!/bin/bash

odoo -c /etc/odoo/odoo.conf -i base --without-demo=all

exec odoo -c /etc/odoo/odoo.conf
