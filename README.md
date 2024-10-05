# Prueba práctica para desarrollador junior en Flutter

## Objetivo

Crear una aplicación en Flutter que permita a los usuarios autenticarse usando Firebase y obtener información desde una API REST pública.

## Requisitos

### 1. Autenticación con Firebase:
- El usuario debe poder registrarse e iniciar sesión utilizando correo electrónico y contraseña.
- Utilizar Firebase Authentication para manejar el registro y el inicio de sesión.
- Implementar la lógica para cerrar sesión.

### 2. API REST:
- Utilizar una API REST gratuita para obtener información y mostrarla en la aplicación.
- [PokeAPI lista](https://pokeapi.co/api/v2/pokemon?limit=1000&offset=0): 
  - Realizar una petición GET a la API para obtener los datos y mostrarlos en una lista o tarjeta.
  - Asegurarse de manejar correctamente los errores en las peticiones.

### 3. Pantallas requeridas:
- **Pantalla de Registro/Iniciar sesión**: 
  - Debe permitir al usuario registrarse e iniciar sesión utilizando Firebase Authentication.
- **Pantalla Principal**: 
  - Una vez autenticado, el usuario será redirigido a la pantalla principal, donde se mostrarán los datos obtenidos de la API en una lista.
- **Pantalla Detalle**: 
  - A partir del elemento seleccionado de la lista, la aplicación navegará al detalle del mismo.
    - [PokeAPI detalle](https://pokeapi.co/api/v2/pokemon/bulbasaur):  Debe mostrar:
      - Nombre del Pokémon.
      - Habilidades.
      - Movimientos.
      - Imagen (sprites/home).
- **Pantalla de Perfil**: 
  - Mostrar el correo electrónico del usuario autenticado y permitir cerrar sesión.

### 4. Gestión de estados:
- Utilizar el paquete `provider` o `riverpod` para la gestión de estado en la aplicación.

---

## Instrucciones para ejecutar el proyecto

1. Clona este repositorio:
   ```bash
   git clone https://github.com/gazalabmx/practical-test
2. Clona este repositorio:
   Genera una rama con tu nombre para realizar el proyecto
3. Una vez terminado, integra tus cambios en tu rama al repositorio.


## ¡Que la Fuerza te acompañe!
