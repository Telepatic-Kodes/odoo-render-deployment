# Odoo en Render

Este proyecto contiene la configuración necesaria para desplegar Odoo 16.0 en la plataforma Render.

## ¿Qué es Odoo?

Odoo es un sistema de gestión empresarial (ERP) de código abierto que incluye módulos para:
- Gestión de clientes (CRM)
- Contabilidad
- Inventario
- Recursos humanos
- Y muchos más

## Archivos del Proyecto

### `requirements.txt`
Contiene todas las dependencias de Python necesarias para Odoo.

### `odoo.conf`
Archivo de configuración de Odoo con configuraciones optimizadas para Render.

### `start.py`
Script de inicio que Render ejecutará para iniciar Odoo.

### `render.yaml`
Archivo de configuración de Render que define los servicios y la base de datos.

## Pasos para Desplegar en Render

### Paso 1: Crear cuenta en Render
1. Ve a [render.com](https://render.com)
2. Crea una cuenta gratuita
3. Verifica tu email

### Paso 2: Conectar tu repositorio
1. En Render, haz clic en "New +"
2. Selecciona "Blueprint"
3. Conecta tu repositorio de GitHub/GitLab
4. Selecciona este repositorio

### Paso 3: Configurar el despliegue
1. Render detectará automáticamente el archivo `render.yaml`
2. Revisa la configuración:
   - **Plan**: Starter (gratuito)
   - **Python Version**: 3.9.16
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python start.py`

### Paso 4: Variables de entorno
Render configurará automáticamente:
- `DATABASE_URL`: URL de la base de datos PostgreSQL
- `PORT`: Puerto del servidor web
- `ADMIN_PASSWORD`: Contraseña del administrador

### Paso 5: Desplegar
1. Haz clic en "Create Blueprint"
2. Render creará automáticamente:
   - Un servicio web para Odoo
   - Una base de datos PostgreSQL
   - Las variables de entorno necesarias

## Acceso a Odoo

Una vez desplegado:
1. Ve a tu dashboard de Render
2. Haz clic en el servicio "odoo-app"
3. Copia la URL del servicio
4. Accede a la URL en tu navegador

## Configuración inicial

Al acceder por primera vez:
1. Odoo te pedirá crear una base de datos
2. Usa los datos de la base de datos de Render
3. Crea tu cuenta de administrador
4. Selecciona los módulos que necesites

## Variables de Entorno Importantes

- `DATABASE_URL`: URL completa de la base de datos PostgreSQL
- `PORT`: Puerto donde se ejecutará Odoo (configurado por Render)
- `ADMIN_PASSWORD`: Contraseña del administrador de Odoo

## Solución de Problemas

### Error de conexión a la base de datos
- Verifica que la base de datos esté creada en Render
- Revisa las variables de entorno en el dashboard de Render

### Error de dependencias
- Verifica que todas las dependencias estén en `requirements.txt`
- Revisa los logs de build en Render

### Error de puerto
- Render configura automáticamente el puerto
- No modifiques la variable `PORT` manualmente

## Costos

- **Plan Starter**: Gratuito (con limitaciones)
- **Base de datos**: Gratuita (hasta 1GB)
- **Tráfico**: Gratuito (hasta 750 horas/mes)

## Recursos Adicionales

- [Documentación de Odoo](https://www.odoo.com/documentation)
- [Documentación de Render](https://render.com/docs)
- [Guía de Python en Render](https://render.com/docs/deploy-python)

## Soporte

Si tienes problemas:
1. Revisa los logs en el dashboard de Render
2. Consulta la documentación oficial
3. Busca en los foros de la comunidad
