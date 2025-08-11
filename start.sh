#!/bin/bash

# Script de inicio para Odoo en Render
# Este script reemplaza las variables de entorno en odoo.conf y inicia Odoo

echo "Starting Odoo configuration..."

# Reemplazar variables de entorno en odoo.conf
if [ -n "$DB_HOST" ]; then
    sed -i "s/\${DB_HOST}/$DB_HOST/g" /etc/odoo/odoo.conf
fi

if [ -n "$DB_PORT" ]; then
    sed -i "s/\${DB_PORT}/$DB_PORT/g" /etc/odoo/odoo.conf
fi

if [ -n "$DB_USER" ]; then
    sed -i "s/\${DB_USER}/$DB_USER/g" /etc/odoo/odoo.conf
fi

if [ -n "$DB_PASSWORD" ]; then
    sed -i "s/\${DB_PASSWORD}/$DB_PASSWORD/g" /etc/odoo/odoo.conf
fi

if [ -n "$DB_NAME" ]; then
    sed -i "s/\${DB_NAME}/$DB_NAME/g" /etc/odoo/odoo.conf
fi

echo "Configuration updated. Starting Odoo..."

# Iniciar Odoo con el puerto asignado por Render
exec odoo -c /etc/odoo/odoo.conf --xmlrpc-port ${PORT:-8069}
