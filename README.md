# Hardeck Bottom Nav

**Hardeck Bottom Nav** es un paquete de Flutter que permite agregar una barra de navegación inferior altamente personalizable con soporte para múltiples íconos, animaciones y funciones adaptables a diversas aplicaciones.

## Características

- Navegación inferior personalizable.
- Animaciones suaves entre pestañas.
- Soporte para múltiples íconos y títulos.
- Fácil de integrar en cualquier proyecto Flutter.

## Instalación

Para utilizar este paquete en tu proyecto Flutter, sigue los siguientes pasos:

1. Abre el archivo `pubspec.yaml` en la raíz de tu proyecto Flutter.
2. Añade la dependencia del paquete `hardeck_bottom_nav` como se muestra a continuación:
   ```yaml
   dependencies:
     hardeck_bottom_nav: ^0.0.1
3. Guarda el archivo pubspec.yaml y ejecuta el siguiente comando en tu terminal para obtener las dependencias:
   ```
    flutter pub get



## Uso
1. Importa el paquete en tu archivo Dart donde deseas usar la barra de navegación inferior:
   ```
    import 'package:hardeck_bottom_nav/hardeck_bottom_nav.dart';

2. Usa el widget HardeckBottomNav dentro de tu Scaffold para mostrar la barra de navegación inferior. Aquí tienes un ejemplo básico:
   ```
    import 'package:flutter/material.dart';
    import 'package:hardeck_bottom_nav/hardeck_bottom_nav.dart';

    class MyHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Hardeck Bottom Nav Demo'),
        ),
        body: Center(
            child: Text('Contenido principal de la aplicación'),
        ),
        bottomNavigationBar: HardeckBottomNav(
            items: [
            BottomNavItem(icon: Icons.home, label: 'Inicio'),
            BottomNavItem(icon: Icons.search, label: 'Buscar'),
            BottomNavItem(icon: Icons.settings, label: 'Configuración'),
            ],
        ),
        );
    }
    }


## Contribución
Si deseas contribuir a este proyecto, puedes hacerlo de las siguientes maneras:
1. Reportar un error: Si encuentras algún problema o tienes sugerencias, puedes abrir un issue.
2. Enviar un Pull Request: Si deseas mejorar el código o agregar una nueva funcionalidad, envía un PR desde tu fork del repositorio.
Antes de enviar un PR, por favor asegúrate de que todo esté correctamente probado.


## Licencia
Este proyecto está bajo la licencia MIT. Puedes encontrar más detalles en el archivo LICENSE.



### Instrucciones incluidas:
1. **Instalación del paquete**: Cómo agregarlo al archivo `pubspec.yaml` y ejecutar `flutter pub get`.
2. **Uso básico**: Instrucciones detalladas de cómo importar y utilizar el widget `HardeckBottomNav`.
3. **Contribución**: Cómo colaborar en el proyecto.
4. **Licencia**: Mención de la licencia del proyecto.

Con este contenido, tu archivo `README.md` explica de manera clara todos los pasos para usar e integrar el paquete en cualquier proyecto Flutter. Solo debes copiar y pegar esto en tu `README.md` y proceder con la publicación en pub.dev.
