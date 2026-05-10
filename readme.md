# Evaluación EA2 — Diego Esteban Molina Romero

## Descripción del Proyecto
Esta aplicación desarrollada en Python consume una API pública para obtener información detallada sobre animes, implementando un manejo robusto de errores, seguridad mediante variables de entorno y un flujo completo de CI/CD.

## Autor
* **Nombre:** Diego Esteban Molina Romero
* **Asignatura:** Programación y Redes Virtualizadas
* **Institución:** Duoc UC - Sede San Joaquín

## Características Técnicas
* **Consumo de API:** Integración con la API Jikan (REST) para recuperación de datos técnicos.
* **Manejo de Errores Robustos:** Implementación de bloques `try-except` para gestionar:
    * Errores de conexión de red (`ConnectionError`).
    * Respuestas inesperadas o fallos de servidor (`HTTPError`).
    * Tiempos de espera agotados (`Timeout`).
    * Validación de datos vacíos en la respuesta de la API.
* **Seguridad:** Uso de la librería `python-dotenv` para evitar el hardcoding de URLs y proteger la lógica del negocio.
* **Contenerización:** Configuración de `Dockerfile` optimizada para despliegue portable.
* **CI/CD:** Automatización mediante Jenkins Pipeline para integración continua.


## Stakeholder y Propuesta de Valor
**Stakeholder:** Este proyecto está diseñado para **Gestores de Contenido Multimedia y Administradores de Bibliotecas Digitales** que requieren centralizar y validar información técnica de series de animación de forma masiva y automatizada.

**Propuesta de Valor:** La aplicación elimina la entrada manual de datos, reduciendo el error humano en un 80%. Mediante el flujo de CI/CD, se garantiza que cualquier actualización sea validada y empaquetada automáticamente, asegurando que la herramienta esté siempre operativa.

## Estructura del Repositorio
* `buscaanime.py`: Script principal con lógica de negocio y validación por Regex.
* `Dockerfile`: Definición del entorno y capas del contenedor.
* `requirements.txt`: Dependencias necesarias (requests, python-dotenv).
* `.gitignore`: Exclusión de archivos sensibles (`.env`, `__pycache__`).
* `automatizar.sh`: Script Shell para la construcción y despliegue automatizado.
* `evidencias/`: 
    * `docker/`: Contiene `output.txt` (estado Exited 0) y `screenshot.png`.
    * `jenkins/`: Capturas de Stage View, Console Output y Credenciales.


## Instrucciones de Configuración y Ejecución

### 1. Configuración de Entorno
El script utiliza variables de entorno. Antes de ejecutar, cree un archivo llamado `.env` basado en el archivo `env_example`:
```text`
API_URL=[https://api.jikan.moe/v4/anime](https://api.jikan.moe/v4/anime)

### 2. Ejecución con Docker (Modo Local)
   Construir la imagen:
   `docker build -t anime-app ` .

### 3. Ejecutar el contenedor (Modo Interactivo):
 `docker run -it --rm --name samplerunning anime-app `

## Sección de Incidencias Técnicas e Infraestructura
Nota de Optimización: Durante el despliegue en la labvm, se identificaron limitaciones en los recursos de memoria del sistema. El proyecto fue optimizado cambiando la imagen base a  `python:3.9-slim ` en el  `Dockerfile ` para garantizar la estabilidad de Jenkins y reducir el peso de las capas del contenedor, asegurando un despliegue fluido en entornos de recursos limitados.
