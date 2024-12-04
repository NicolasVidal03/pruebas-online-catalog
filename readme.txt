Proyecto de Automatización: Pruebas Online Catalog
Este proyecto utiliza Cucumber para realizar pruebas automatizadas. A continuación, se detalla cómo ejecutar las pruebas.

Requisitos Previos
Antes de comenzar, asegúrate de tener los siguientes requisitos cumplidos:

Ruby instalado.
Cucumber instalado (gem install cucumber).
Las dependencias necesarias instaladas (usa bundle install si usas Bundler).
Ejecución de Pruebas
Prueba 1: GMO (About GMO Page)
Para ejecutar las pruebas relacionadas con la página GMO:
´´´
cucumber features\aboutGMO.feature
´´´
Prueba 2: Test Page
Para ejecutar las pruebas de la página de pruebas general:

´´´
cucumber features\testPage.feature
´´´
Ejecución de Todas las Pruebas
Si deseas ejecutar todas las pruebas de forma conjunta:

´´´
cucumber
´´´

Opciones Adicionales
Puedes personalizar la ejecución usando opciones de Cucumber:

Para generar un informe en HTML:

´´´
cucumber --format html --out report.html
´´´
Para ejecutar un conjunto específico de pruebas basado en etiquetas:

´´´
cucumber --tags @nombre_etiqueta
´´´
Estructura del Proyecto
Una breve descripción de la estructura de carpetas para orientar a los nuevos colaboradores:

features/: Contiene los archivos .feature con los escenarios de prueba.
step_definitions/: Contiene las definiciones de los pasos (mapeo de los pasos en lenguaje natural a código Ruby).
support/: Archivos de configuración y hooks de inicialización.
