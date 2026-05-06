import requests
import os
import re # Librería para validar texto
from dotenv import load_dotenv
from requests.exceptions import ConnectionError, Timeout, HTTPError

load_dotenv()

def buscar_anime():
    nombre = input("Ingresa el nombre del anime: ")
    
    # 1. VALIDACIÓN: Si el usuario pone símbolos prohibidos, lanzamos un error forzadoOne
    # Esta expresión regular permite letras, números y espacios
    if not re.match("^[a-zA-Z0-9 ]*$", nombre) or not nombre.strip():
        print("❌ Error: Entrada inválida. Por favor, usa solo letras y números.")
        return # Salimos de la función sin llamar a la API

    url = f"https://api.jikan.moe/v4/anime?q={nombre}&limit=1"
    
    try:
        response = requests.get(url, timeout=5)
        # Esto lanzará un HTTPError si el código es 4xx o 5xx
        response.raise_for_status() 
        
        data = response.json()
        
        # 2. Si la API devuelve un JSON válido pero vacío (ej: nombre inexistente)
        if not data['data']:
            print("⚠️ No se encontró ningún anime con ese nombre.")
        else:
            anime = data['data'][0]
            print(f"\n✅ Título: {anime['title']}")
            print(f"⭐ Puntaje: {anime['score']}")
            print(f"📺 Episodios: {anime['episodes']}")

    # Manejo de los errores que pide tu pauta
    except ConnectionError:
        print("❌ Error: Problema de conexión a internet.")
    except Timeout:
        print("❌ Error: La API tardó demasiado en responder (Timeout).")
    except HTTPError as e:
        # Aquí capturamos el 404 real de la API si la URL falla
        print(f"❌ Error HTTP: {e}")
    except Exception as e:
        print(f"❌ Error inesperado: {e}")

if __name__ == "__main__":
    buscar_anime()