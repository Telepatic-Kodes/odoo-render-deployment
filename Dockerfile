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

# Establecemos los permisos correctos para que Odoo pueda acceder a los archivos
# 'odoo:odoo' es el usuario y grupo que usa la imagen oficial
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo

# Cambiamos al usuario odoo por seguridad
# Es una buena práctica no ejecutar aplicaciones como root
USER odoo

# Comando que se ejecuta cuando el contenedor inicia
# Render asigna automáticamente una variable de entorno $PORT
# La pasamos a Odoo para que use ese puerto específico
CMD ["bash", "-c", "odoo -c /etc/odoo/odoo.conf --xmlrpc-port ${PORT}"]
