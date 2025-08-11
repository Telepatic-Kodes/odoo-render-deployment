# 📦 Módulos Personalizados de Odoo

Esta carpeta está destinada para módulos personalizados de Odoo.

## 📁 Estructura de un Módulo

Un módulo típico de Odoo tiene esta estructura:

```
mi_modulo/
├── __init__.py
├── __manifest__.py
├── models/
│   ├── __init__.py
│   └── mi_modelo.py
├── views/
│   └── mi_vista.xml
├── security/
│   └── ir.model.access.csv
└── static/
    └── description/
        └── icon.png
```

## 🚀 Cómo Agregar un Módulo

1. **Crea la carpeta del módulo** en esta ubicación
2. **Desarrolla tu módulo** siguiendo la estructura de Odoo
3. **Haz commit y push** a GitHub
4. **Render automáticamente redeployará** tu aplicación

## 📚 Ejemplo Básico

### `__manifest__.py`
```python
{
    'name': 'Mi Módulo',
    'version': '1.0',
    'category': 'Customizations',
    'summary': 'Descripción corta del módulo',
    'description': 'Descripción larga del módulo',
    'author': 'Tu Nombre',
    'website': 'https://tuwebsite.com',
    'depends': ['base'],
    'data': [
        'security/ir.model.access.csv',
        'views/mi_vista.xml',
    ],
    'installable': True,
    'application': True,
}
```

## 🔗 Recursos Útiles

- [Guía de desarrollo de módulos de Odoo](https://www.odoo.com/documentation/18.0/developer/reference.html)
- [Ejemplos de módulos](https://github.com/odoo/odoo/tree/18.0/addons)
- [Comunidad de desarrolladores](https://www.odoo.com/forum/help-1)

---

**💡 Tip**: Siempre prueba tus módulos en un entorno de desarrollo antes de subirlos a producción.
