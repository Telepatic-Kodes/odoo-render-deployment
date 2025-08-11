# 🚀 Odoo en Render - Guía de Instalación

Este repositorio contiene la configuración necesaria para desplegar **Odoo 18.0** en **Render** usando Docker.

## 📋 Prerrequisitos

- Una cuenta en [GitHub](https://github.com)
- Una cuenta en [Render](https://render.com)
- Una base de datos PostgreSQL (puede ser en Render o externa)

## 🏗️ Estructura del Proyecto

```
odoo-render/
├── Dockerfile          # Configuración de Docker
├── odoo.conf          # Configuración de Odoo
├── addons/            # Módulos personalizados
│   └── .gitkeep      # Mantiene la carpeta en Git
└── README.md         # Este archivo
```

## 🚀 Pasos para el Despliegue

### 1. Crear Repositorio en GitHub

1. Crea un nuevo repositorio en GitHub (ej: `odoo-render`)
2. Sube estos archivos a tu repositorio:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Odoo configuration for Render"
   git branch -M main
   git remote add origin https://github.com/TU_USUARIO/odoo-render.git
   git push -u origin main
   ```

### 2. Crear Base de Datos PostgreSQL

En Render, crea un nuevo **PostgreSQL**:
- **Name**: `odoo-database`
- **Database**: `odoo`
- **User**: `odoo_user`
- **Region**: Elige la más cercana a ti

### 3. Crear Servicio Web en Render

1. Ve a [Render Dashboard](https://dashboard.render.com)
2. Haz clic en **"New +"** → **"Web Service"**
3. Conecta tu repositorio de GitHub
4. Configura el servicio:

#### Configuración Básica:
- **Name**: `odoo-app`
- **Runtime**: `Docker`
- **Region**: La misma que tu base de datos

#### Variables de Entorno:
```
PORT=8069
DB_HOST=tu-host-postgres.render.com
DB_PORT=5432
DB_USER=odoo_user
DB_PASSWORD=tu-contraseña-postgres
DB_NAME=odoo
```

#### Disco Persistente:
- **Path**: `/var/lib/odoo`
- **Size**: `1 GB` (mínimo)

### 4. Desplegar

1. Haz clic en **"Create Web Service"**
2. Render comenzará a construir y desplegar tu aplicación
3. El proceso puede tomar 5-10 minutos

### 5. Configurar Odoo

1. Una vez desplegado, ve a la URL pública de tu servicio
2. Sigue el asistente de configuración de Odoo
3. Crea tu primera base de datos y usuario administrador

## ⚙️ Configuración Avanzada

### Variables de Entorno Adicionales

Puedes agregar estas variables para personalizar más Odoo:

```
# Configuración de email
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=tu-email@gmail.com
SMTP_PASSWORD=tu-contraseña-app

# Configuración de seguridad
ADMIN_PASSWORD=contraseña-super-segura
```

### Módulos Personalizados

Para agregar módulos personalizados:

1. Coloca tus módulos en la carpeta `addons/`
2. Haz commit y push a GitHub
3. Render automáticamente redeployará tu aplicación

## 🔧 Solución de Problemas

### Error de Conexión a Base de Datos
- Verifica que las variables de entorno `DB_*` estén correctas
- Asegúrate de que la base de datos esté en la misma región

### Error de Puerto
- Render asigna automáticamente el puerto a través de `$PORT`
- No cambies la variable `PORT` en las variables de entorno

### Problemas de Permisos
- Los archivos ya tienen los permisos correctos en el Dockerfile
- Si persisten problemas, verifica los logs en Render

## 📚 Recursos Adicionales

- [Documentación oficial de Odoo](https://www.odoo.com/documentation/18.0/)
- [Documentación de Render](https://render.com/docs)
- [Docker Hub - Odoo](https://hub.docker.com/_/odoo)

## 🤝 Contribuciones

Si encuentras algún problema o tienes sugerencias, no dudes en crear un issue en este repositorio.

---

**¡Listo! Tu Odoo estará funcionando en Render en unos minutos.** 🎉
