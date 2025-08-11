# ✅ Checklist de Despliegue - Odoo en Render

## 📋 Pasos Previos al Despliegue

### 1. Crear Repositorio en GitHub
- [ ] Crear nuevo repositorio en GitHub (ej: `odoo-render`)
- [ ] Copiar la URL del repositorio
- [ ] Ejecutar: `git remote add origin https://github.com/TU_USUARIO/odoo-render.git`
- [ ] Ejecutar: `git push -u origin main`

### 2. Crear Base de Datos PostgreSQL en Render
- [ ] Ir a [Render Dashboard](https://dashboard.render.com)
- [ ] Crear nuevo **PostgreSQL**
- [ ] Configurar:
  - **Name**: `odoo-database`
  - **Database**: `odoo`
  - **User**: `odoo_user`
  - **Region**: Elegir la más cercana
- [ ] Anotar los datos de conexión:
  - Host interno
  - Puerto
  - Usuario
  - Contraseña
  - Nombre de la base de datos

### 3. Crear Servicio Web en Render
- [ ] En Render Dashboard, crear **Web Service**
- [ ] Conectar el repositorio de GitHub
- [ ] Configurar:
  - **Name**: `odoo-app`
  - **Runtime**: `Docker`
  - **Region**: Misma que la base de datos

### 4. Configurar Variables de Entorno
```
PORT=8069
DB_HOST=tu-host-postgres.render.com
DB_PORT=5432
DB_USER=odoo_user
DB_PASSWORD=tu-contraseña-postgres
DB_NAME=odoo
```

### 5. Configurar Disco Persistente
- [ ] **Path**: `/var/lib/odoo`
- [ ] **Size**: `1 GB` (mínimo)

### 6. Desplegar
- [ ] Hacer clic en **"Create Web Service"**
- [ ] Esperar 5-10 minutos para el despliegue
- [ ] Verificar que el estado sea "Live"

### 7. Configurar Odoo
- [ ] Ir a la URL pública del servicio
- [ ] Seguir el asistente de configuración
- [ ] Crear base de datos inicial
- [ ] Crear usuario administrador

## 🔧 Verificaciones Post-Despliegue

### Funcionalidad Básica
- [ ] Odoo carga correctamente
- [ ] Puedes iniciar sesión
- [ ] La base de datos funciona
- [ ] Los módulos se cargan

### Configuración de Seguridad
- [ ] Cambiar contraseña de administrador
- [ ] Configurar HTTPS (si es necesario)
- [ ] Revisar logs de errores

### Optimización
- [ ] Configurar backup automático
- [ ] Monitorear uso de recursos
- [ ] Configurar dominio personalizado (opcional)

## 🚨 Solución de Problemas Comunes

### Error: "Database connection failed"
- Verificar variables de entorno `DB_*`
- Asegurar que la base de datos esté en la misma región
- Verificar que la base de datos esté activa

### Error: "Port already in use"
- No cambiar la variable `PORT=8069`
- Render asigna automáticamente el puerto

### Error: "Permission denied"
- Los permisos ya están configurados en el Dockerfile
- Verificar logs en Render Dashboard

## 📞 Recursos de Ayuda

- [Documentación de Render](https://render.com/docs)
- [Documentación de Odoo](https://www.odoo.com/documentation/18.0/)
- [Comunidad de Odoo](https://www.odoo.com/forum/help-1)

---

**🎉 ¡Tu Odoo estará funcionando en Render!**
