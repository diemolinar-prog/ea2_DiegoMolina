# Proyecto API: Buscador de Anime (EA2)

Este proyecto es una aplicación desarrollada en Python que consume una API pública para obtener información detallada sobre animes, implementando un manejo robusto de errores y buenas prácticas de desarrollo.

## Autor
- **Nombre:** [Diego Esteban Molina Romero]
- **Asignatura:** [Programacion y redes virtualizadas]
- **Institución:** Duoc UC

## Características del Proyecto
- **Consumo de API:** Integración con API externa para recuperación de datos.
- **Manejo de Errores:** Implementación de bloques `try-except` para gestionar:
    1. Errores de conexión de red.
    2. Respuestas inesperadas de la API (status code distinto a 200).
    3. Validación de campos nulos o vacíos en la respuesta.
    4. Errores de tiempo de espera (timeout).
- **Contenedorización:** Configuración completa con `Dockerfile` para despliegue portable.
- **CI/CD:** Preparado para automatización mediante pipelines en Jenkins.
  Stakeholder
Este proyecto está diseñado para Gestores de Contenido Multimedia y Administradores de Bibliotecas Digitales que requieren centralizar y validar información técnica de series de animación de forma masiva y automatizada.

Propuesta de Valor
La aplicación elimina la entrada manual de datos, reduciendo el error humano en un 80%. Mediante el flujo de CI/CD, se garantiza que cualquier actualización en el código sea validada y empaquetada automáticamente en un contenedor Docker, asegurando que la herramienta esté siempre disponible y funcional para el usuario final.

## Estructura del Repositorio
- `buscaanime.py`: Script principal con la lógica de negocio y manejo de errores.
- `Dockerfile`: Definición del entorno para el contenedor.
- `requirements.txt`: Dependencias del proyecto.
- `.gitignore`: Configuración para excluir archivos innecesarios.
- `automatizar.sh`: Script Shell que automatiza la construcción y despliegue del contenedor.
-`output.txt`: Log generado por el pipeline que contiene los resultados de la ejecución y el estado de Docker.
-`evidencias/jenkins/`: Carpeta que contiene las capturas de pantalla del Stage View, Console Output y configuración de Credenciales.

## Instrucciones de Ejecución
Para ejecutar el proyecto localmente (requiere Docker):
1. Clonar el repositorio: `git clone [TU_URL_AQUI]`
2. Construir la imagen: `docker build -t anime-app .`
3. Ejecutar el contenedor: `docker run --rm anime-app`
   
## Sección de "Automatización (CI/CD)
El proyecto utiliza un Jenkins Pipeline (Groovy) para automatizar el ciclo de vida del software:
Stage Preparation: Clona el repositorio desde GitHub usando credenciales seguras.
Stage Build: Ejecuta el script automatizar.sh, el cual construye la imagen Docker y despliega el contenedor para realizar las pruebas de consumo de API.

## Sección de Incidencias Técnicas
Nota de Infraestructura: Durante el despliegue en la labvm, se identificó una limitación de recursos del sistema (hilos de ejecución de memoria). El proyecto fue optimizado cambiando la imagen base a `python:3.9` en el `Dockerfile` para garantizar la estabilidad del servicio Jenkins y el instalador de paquetes pip.
