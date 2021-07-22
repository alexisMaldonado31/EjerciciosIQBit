# EjerciciosIQBit
- Backend desarrollado en .netCore 3.1 que lee un archivo .json mediante endpoints.

Esta implementación cuenta con un módulo Swagger para la documentación de las API´s. También, se puede probar su funcionamiento desde el módulo Swagger.

El Proyecto esta disponible en la siguiente Ruta: http://alexis31-001-site1.ftempurl.com/swagger/index.html

Instalación:
1. Instalar el SDK de .Net Core 3.1 
https://dotnet.microsoft.com/download/dotnet/3.1
2. En el editor de Visual Studio Code, instalar las dependencias de C# 
https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
3. Descargar el proyecto y abrir la carpeta IQBIT-Backend (no el archivo IqBIT-Backend.sln) en el editor de texto Visual Studio Code.
4. En una terminal ejecutar el comando dotnet run, esto levantará el servidor IIS Local el cual nos proveera una direccion de localhost en donde podremos hacer uso de las API´s

Vista Previa

![Swagger](https://github.com/alexisMaldonado31/EjerciciosIQBit/blob/main/AssetsReadme/SwaggerBackend.png)

- Frontend desarrollado en Flutter, donde muestra un aplicativo que consume al API de GitHub para buscar un usuario y sus repositorios

Esta implementación esta disponible tanto para web como para dispositivos móviles Android y iOS (para compilar con iOS es necesario de un equipo con sistema operativo MacOS).

El Proyecto Web esta disponible en la siguiente Ruta: https://amazing-boyd-abb0ae.netlify.app

Instalación:
1. Instalar el SDK de Flutter en Visual Studio Code utilizando la siguiente extensión https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
2. Descargar el proyecto y abrirlo en Visual Studio Code.
3. Abrir el archivo pubspec.yaml y clic en get packages o en una terminal ejecutar el comando : flutter pub get.
4. Ejecutar el proyecto. Este se ejecutará en el dispositivo seleccionado que puede ser web o cualquier dispositivo móvil físico o virtual.

Vista Previa

![WelcomePage](https://github.com/alexisMaldonado31/EjerciciosIQBit/blob/main/AssetsReadme/FlutterWelcome.png)
![UserPage](https://github.com/alexisMaldonado31/EjerciciosIQBit/blob/main/AssetsReadme/FlutterUserGitHub.png)
