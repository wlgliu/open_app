# open_app

A new flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## 引入包
```dart
import 'package:open_app/open_app.dart';
```

## 是否下载 App
```dart
bool isInstall = await OpenApp.isInstalledApp(packageName);
```

## 打开 App
```dart
bool result = await OpenApp.openApp(packageName);
```
