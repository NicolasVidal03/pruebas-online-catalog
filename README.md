# Proyecto de Automatización: Pruebas Catalogo

Este proyecto utiliza **Cucumber** para realizar pruebas automatizadas. A continuación, se detalla cómo ejecutar las pruebas.

## Requisitos Previos

Antes de comenzar, asegúrate de tener los siguientes requisitos cumplidos:

- Ruby instalado.
- Cucumber instalado (`gem install cucumber`).
- Las dependencias necesarias instaladas (usa `bundle install` si usas Bundler).

## Ejecución de Pruebas

### Prueba 1: GMO (About GMO Page)

Para ejecutar las pruebas relacionadas con la página GMO:

```bash
cucumber features\aboutGMO.feature
```
### Prueba 2: Big Order 

Para ejecutar las pruebas relacionadas con las ordenes grandes:

```bash
cucumber features\bigOrder.feature
```
### Prueba 3: Billing

Para ejecutar las pruebas relacionadas con la facturación de los pedidos:

```bash
cucumber features\billing.feature
```
### Prueba 4: Catalog Detail

Para ejecutar las pruebas relacionadas con la vista detallada del catalogo:

```bash
cucumber features\catalogDetail.feature
```
### Prueba 5: Home Page

Para ejecutar las pruebas relacionadas con la pagina inicial del sitio web:

```bash
cucumber features\homePage.feature
```
### Prueba 6: Reset Form

Para ejecutar las pruebas relacionadas con el reinicio de los valores de los pedidos en el input:

```bash
cucumber features\resetForm.feature
```
### Prueba 7: Small Catalog

Para ejecutar las pruebas relacionadas con la vista del catalogo simple:

```bash
cucumber features\smallCatalog.feature
```
### Prueba 8: Small Order

Para ejecutar las pruebas relacionadas con la realizacion de ordenes pequeñas:

```bash
cucumber features\smallOrder.feature
```
### Prueba 9: Browser Test Page

Para ejecutar las pruebas relacionadas con lla pagina de visualizacion de navegadores:

```bash
cucumber features\testPage.feature
```
## Ejecución de Todas las Pruebas
Si deseas ejecutar todas las pruebas de forma conjunta:

```bash
cucumber
```

## Opciones Adicionales
Puedes personalizar la ejecución usando opciones de Cucumber:

Para generar un informe en HTML:

```bash
cucumber --format html --out report.html
```
Para ejecutar un conjunto específico de pruebas basado en etiquetas:

## Estructura del Proyecto
Una breve descripción de la estructura de carpetas:

- features/: Contiene los archivos .feature con los escenarios de prueba.
- step_definitions/: Contiene las definiciones de los pasos (mapeo de los pasos en lenguaje natural a código Ruby).
- support/: Archivos de configuración y hooks de inicialización.
