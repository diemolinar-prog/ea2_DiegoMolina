#!/bin/bash

# Limpiar directorio temporal
rm -rf tempdir
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

# Copiar archivos necesarios
cp sample_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

# Crear el Dockerfile dinámicamente
echo "FROM python" >> tempdir/Dockerfile
echo "RUN python3 -m pip install flask --no-cache-dir --progress-bar off" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python /home/myapp/sample_app.py" >> tempdir/Dockerfile

cd tempdir

# Detener y eliminar contenedor previo si existe para evitar conflictos de nombre/puerto
docker rm -f samplerunning 2>/dev/null

# Construir y ejecutar la imagen
docker build -t sampleapp .
docker run -t -d -p 5050:5050 --name samplerunning sampleapp
docker ps -a
