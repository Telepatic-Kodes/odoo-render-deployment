#!/usr/bin/env python3
"""
Script de inicio para Odoo en Render
Este script configura y inicia Odoo con las variables de entorno de Render
"""

import os
import sys
import subprocess
import logging

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def setup_environment():
    """Configurar variables de entorno necesarias para Odoo"""
    
    # Obtener variables de entorno de Render
    port = os.environ.get('PORT', '8080')
    database_url = os.environ.get('DATABASE_URL', '')
    
    # Parsear DATABASE_URL si existe
    if database_url:
        # Formato típico: postgresql://user:password@host:port/database
        try:
            # Extraer componentes de la URL de la base de datos
            if database_url.startswith('postgresql://'):
                db_parts = database_url.replace('postgresql://', '').split('@')
                if len(db_parts) == 2:
                    user_pass = db_parts[0].split(':')
                    host_port_db = db_parts[1].split('/')
                    
                    if len(user_pass) >= 2 and len(host_port_db) >= 2:
                        db_user = user_pass[0]
                        db_password = user_pass[1]
                        host_port = host_port_db[0].split(':')
                        db_host = host_port[0]
                        db_port = host_port[1] if len(host_port) > 1 else '5432'
                        db_name = host_port_db[1]
                        
                        # Establecer variables de entorno
                        os.environ['DB_USER'] = db_user
                        os.environ['DB_PASSWORD'] = db_password
                        os.environ['DB_HOST'] = db_host
                        os.environ['DB_PORT'] = db_port
                        os.environ['DB_NAME'] = db_name
                        
                        logger.info(f"Base de datos configurada: {db_host}:{db_port}/{db_name}")
        except Exception as e:
            logger.error(f"Error al parsear DATABASE_URL: {e}")
    
    # Establecer puerto
    os.environ['PORT'] = port
    logger.info(f"Puerto configurado: {port}")
    
    return port

def start_odoo():
    """Iniciar Odoo con la configuración apropiada"""
    
    try:
        # Configurar entorno
        port = setup_environment()
        
        # Comando para iniciar Odoo
        cmd = [
            'odoo',
            '--config=/opt/odoo/odoo.conf',
            '--http-port=' + port,
            '--http-interface=0.0.0.0',
            '--database=' + os.environ.get('DB_NAME', 'odoo'),
            '--db_host=' + os.environ.get('DB_HOST', 'localhost'),
            '--db_port=' + os.environ.get('DB_PORT', '5432'),
            '--db_user=' + os.environ.get('DB_USER', 'odoo'),
            '--db_password=' + os.environ.get('DB_PASSWORD', ''),
            '--no-database-list',
            '--proxy-mode'
        ]
        
        logger.info("Iniciando Odoo...")
        logger.info(f"Comando: {' '.join(cmd)}")
        
        # Ejecutar Odoo
        subprocess.run(cmd, check=True)
        
    except subprocess.CalledProcessError as e:
        logger.error(f"Error al iniciar Odoo: {e}")
        sys.exit(1)
    except Exception as e:
        logger.error(f"Error inesperado: {e}")
        sys.exit(1)

if __name__ == '__main__':
    start_odoo()
