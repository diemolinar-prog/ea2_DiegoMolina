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

## Estructura del Repositorio
- `buscaanime.py`: Script principal con la lógica de negocio y manejo de errores.
- `Dockerfile`: Definición del entorno para el contenedor.
- `requirements.txt`: Dependencias del proyecto.
- `.gitignore`: Configuración para excluir archivos innecesarios.

## Instrucciones de Ejecución
Para ejecutar el proyecto localmente (requiere Docker):
1. Clonar el repositorio: `git clone [TU_URL_AQUI]`
2. Construir la imagen: `docker build -t anime-app .`
3. Ejecutar el contenedor: `docker run --rm anime-app`