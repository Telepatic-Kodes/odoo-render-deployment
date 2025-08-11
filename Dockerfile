# Dockerfile para Odoo en Render
# Este archivo define cómo construir la imagen de Docker para Odoo

# Usamos la imagen oficial de Odoo 18.0
# Esta imagen ya tiene Python, PostgreSQL client, y todas las dependencias necesarias
FROM odoo:18.0

# Copiamos nuestra configuración personalizada de Odoo
# Este archivo contiene la configuración de la base de datos y otros parámetros
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copiamos la carpeta de módulos adicionales (addons personalizados)
# Estos son módulos que puedes desarrollar o instalar aparte de los oficiales
COPY ./addons /mnt/extra-addons

# Render asigna el puerto a través de $PORT, así que se lo pasamos a Odoo
# Usamos envsubst para expandir las variables de entorno en el archivo de configuración
# y luego ejecutamos Odoo con la configuración procesada
CMD ["bash", "-c", "envsubst < /etc/odoo/odoo.conf > /tmp/odoo.conf && odoo -c /tmp/odoo.conf --xmlrpc-port ${PORT}"]
