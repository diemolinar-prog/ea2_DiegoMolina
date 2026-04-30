#!/bin/bash

echo "==============================================="
echo "   INICIANDO AUTOMATIZACIÓN DE DESPLIEGUE (EA2)"
echo "==============================================="

# 1. Definir nombre de la carpeta de trabajo
DIRECTORIO="despliegue_automatizado"

# 2. Crear directorio si no existe y entrar en él
echo "[+] Creando estructura de directorios..."
if [ -d "$DIRECTORIO" ]; then
    rm -rf "$DIRECTORIO"
fi
mkdir "$DIRECTORIO"
cd "$DIRECTORIO"

# 3. Crear el script de Python (buscaanime.py) con manejo de errores
echo "[+] Generando script de Python..."
cat <<EOF > buscaanime.py
import requests

def buscar_anime():
    print("--- Buscador de Anime (Automatizado) ---")
    url = "https://api.jikan.moe/v4/random/anime"
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        data = response.json()['data']
        print(f"Anime: {data.get('title', 'N/A')}")
        print(f"Tipo: {data.get('type', 'N/A')}")
        print(f"Puntaje: {data.get('score', 'N/A')}")
    except requests.exceptions.ConnectionError:
        print("Error: No hay conexión a internet.")
    except Exception as e:
        print(f"Error inesperado: {e}")

if __name__ == "__main__":
    buscar_anime()
EOF

# 4. Crear el archivo de dependencias
echo "[+] Creando requirements.txt..."
echo "requests" > requirements.txt

# 5. Crear el Dockerfile dinámicamente
echo "[+] Generando Dockerfile..."
cat <<EOF > Dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "buscaanime.py"]
EOF

# 6. Construir y ejecutar el contenedor Docker
echo "[+] Iniciando Build de Docker..."
docker build -t anime-app-final .

echo "[+] Ejecutando Contenedor..."
docker run --rm anime-app-final

echo "==============================================="
echo "   PROCESO COMPLETADO EXITOSAMENTE"
echo "==============================================="