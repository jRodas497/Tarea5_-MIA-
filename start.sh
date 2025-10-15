#!/bin/bash
# ----------------------------------------
# Script para iniciar la API en Flask
# Autor: Tu Nombre
# Proyecto: API + Front EC2
# ----------------------------------------

echo "🚀 Iniciando servidor Flask..."

# Activar entorno virtual si existe
if [ -d ".venv" ]; then
    echo "Activando entorno virtual..."
    source .venv/bin/activate
fi

# Instalar dependencias
echo "📦 Instalando dependencias..."
pip install -r requirements.txt

# Ejecutar el servidor Flask en el puerto 5000 accesible desde cualquier IP
echo "🌐 Ejecutando app.py en http://0.0.0.0:5000/"
python3 app.py
