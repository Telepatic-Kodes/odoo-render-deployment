# Dockerfile para Odoo en Render
# Este archivo define cómo construir la imagen de Docker para Odoo

# Usamos la imagen oficial de Odoo 18.0
# Esta imagen ya tiene Python, PostgreSQL client, y todas las dependencias necesarias
FROM odoo:18.0

# Instalamos envsubst para procesar variables de entorno
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# Copiamos nuestra configuración personalizada de Odoo
# Este archivo contiene la configuración de la base de datos y otros parámetros
COPY ./odoo.conf /etc/odoo/odoo.conf.template

# Copiamos la carpeta de módulos adicionales (addons personalizados)
# Estos son módulos que puedes desarrollar o instalar aparte de los oficiales
COPY ./addons /mnt/extra-addons

# Creamos un script de entrada que procese las variables de entorno
RUN echo '#!/bin/bash\n\
# Procesar variables de entorno en el archivo de configuración\n\
envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf\n\
\n\
# Iniciar Odoo con la configuración procesada\n\
exec odoo -c /etc/odoo/odoo.conf --xmlrpc-port ${PORT:-8069}\n\
' > /entrypoint.sh && chmod +x /entrypoint.sh

# Usar nuestro script de entrada personalizado
ENTRYPOINT ["/entrypoint.sh"]
