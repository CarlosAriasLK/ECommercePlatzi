# ECommprarse

E-Commerce usando la API de Platzi

## 📱 Descripción

Aplicación móvil de comercio electrónico desarrollada en Flutter que consume la API de Platzi. Permite a los usuarios navegar por productos, gestionar un carrito de compras, y realizar autenticación de usuarios.

## 🚀 Tecnologías Utilizadas

### Framework y Lenguaje
- **Flutter** ^3.8.1 - Framework de desarrollo multiplataforma
- **Dart** ^3.8.1 - Lenguaje de programación

### Gestión de Estado
- **Riverpod** ^2.6.1 - Gestión de estado reactiva y robusta
- **Riverpod Annotation** ^2.6.1 - Generación de código para Riverpod
- **Riverpod Generator** ^2.6.5 - Generador de código

### Navegación
- **Go Router** ^16.2.1 - Sistema de navegación declarativo con soporte para deep linking

### Networking
- **Dio** ^5.9.0 - Cliente HTTP para consumo de APIs REST

### Persistencia de Datos
- **Shared Preferences** ^2.5.3 - Almacenamiento local de preferencias
- **SQLite** ^2.4.2 - Base de datos local para persistencia de datos

### UI/UX
- **Google Fonts** ^6.3.1 - Tipografías personalizadas
- **Card Swiper** ^3.0.1 - Componente de carrusel de tarjetas
- **Animate Do** ^4.2.0 - Animaciones predefinidas
- **Search Page** ^2.3.0 - Funcionalidad de búsqueda

### Herramientas de Desarrollo
- **Build Runner** ^2.5.4 - Generación de código
- **Custom Lint** ^0.7.6 - Linting personalizado
- **Riverpod Lint** ^2.6.5 - Reglas de linting específicas para Riverpod
- **Flutter Launcher Icons** ^0.14.4 - Generación de iconos de aplicación
- **Change App Package Name** ^1.5.0 - Cambio de nombre del paquete

## 🏗️ Arquitectura y Principios

### Clean Architecture
El proyecto sigue los principios de **Clean Architecture** con una separación clara de capas:
- **Domain**: Entidades y casos de uso del negocio
- **Infrastructure**: Implementación de repositorios y fuentes de datos
- **Presentation**: UI, widgets, screens y providers

### Características por Módulos (Feature-First)
Organización del código por funcionalidades:
- **Auth**: Autenticación de usuarios
- **Store**: Gestión de productos y carrito de compras
- **Shared**: Componentes reutilizables

### Principios SOLID
- **Single Responsibility**: Cada clase tiene una única responsabilidad
- **Dependency Inversion**: Las capas superiores no dependen de las inferiores
- **Open/Closed**: Abierto para extensión, cerrado para modificación

### Gestión de Estado con Riverpod
- Uso de **providers** para gestión de estado global
- **StateNotifier** para estados complejos
- Separación clara entre lógica de negocio y UI

### Code Generation
Utilización de generación de código para reducir boilerplate y errores:
- Riverpod generators
- Build runner para generación automática

## 📋 Requisitos Previos

- Flutter SDK ^3.8.1
- Dart SDK ^3.8.1
- Android Studio / Xcode (para emuladores)
- Visual Studio Code (recomendado)

## 🔧 Instalación y Configuración

### 1. Clonar el repositorio
```bash
git clone https://github.com/CarlosAriasLK/ECommercePlatzi.git
cd ECommercePlatzi
```

### 2. Instalar dependencias
```bash
flutter pub get
```

### 3. Generar código con Build Runner
```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. (Opcional) Mantener Build Runner en modo watch
Para desarrollo continuo, mantén Build Runner observando cambios:
```bash
dart run build_runner watch -d
```

## ▶️ Cómo Ejecutar

### Ejecutar en modo debug
```bash
flutter run
```

### Ejecutar en un dispositivo específico
```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en un dispositivo específico
flutter run -d <device_id>
```

### Compilar para producción

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

## 🛠️ Comandos Útiles

### Cambiar el nombre del paquete
```bash
dart run change_app_package_name:main com.carlosarias.ecommprarse
```

### Generar iconos de la aplicación
```bash
dart run flutter_launcher_icons:generate
```

### Limpiar el proyecto
```bash
flutter clean
flutter pub get
```

## 📱 Funcionalidades

- ✅ Autenticación de usuarios
- ✅ Navegación por categorías de productos
- ✅ Vista detallada de productos
- ✅ Carrito de compras
- ✅ Búsqueda de productos
- ✅ Persistencia de datos local
- ✅ Animaciones y transiciones fluidas
- ✅ Diseño responsive

## 📝 Estructura del Proyecto

```
lib/
├── main.dart
├── config/
│   ├── database/       # Configuración de base de datos
│   ├── router/         # Configuración de navegación
│   └── theme/          # Tema de la aplicación
└── features/
    ├── auth/           # Autenticación
    │   ├── domain/
    │   ├── infrastructure/
    │   └── presentation/
    ├── store/          # Tienda y productos
    │   ├── domain/
    │   ├── infrastructure/
    │   └── presentation/
    └── shared/         # Componentes compartidos
```
