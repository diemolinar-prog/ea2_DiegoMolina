# 1. Definimos la imagen base: un sistema Linux ligero con Python preinstalado
FROM python:3.9-slim

# 2. Creamos un directorio de trabajo dentro del contenedor (nuestra "carpeta" interna)
WORKDIR /app

# 3. Copiamos primero solo el archivo de requerimientos para aprovechar el caché
COPY requirements.txt .

# 4. Instalamos las librerías necesarias dentro del contenedor
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiamos el resto de los archivos de tu PC al contenedor
COPY buscaanime.py .

# 6. Comando para ejecutar tu script cuando inicies el contenedor
CMD ["python", "-u", "buscaanime.py"]