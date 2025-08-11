#!/bin/bash

# Script de entrada para Odoo en Render
# Reemplaza las variables de entorno en odoo.conf

echo "Configurando Odoo..."

# Reemplazar variables de entorno en odoo.conf
sed -i "s/\${DB_HOST}/$DB_HOST/g" /etc/odoo/odoo.conf
sed -i "s/\${DB_PORT}/$DB_PORT/g" /etc/odoo/odoo.conf
sed -i "s/\${DB_USER}/$DB_USER/g" /etc/odoo/odoo.conf
sed -i "s/\${DB_PASSWORD}/$DB_PASSWORD/g" /etc/odoo/odoo.conf
sed -i "s/\${DB_NAME}/$DB_NAME/g" /etc/odoo/odoo.conf

echo "Configuración completada. Iniciando Odoo..."

# Ejecutar Odoo
exec odoo -c /etc/odoo/odoo.conf --xmlrpc-port ${PORT:-8069}
