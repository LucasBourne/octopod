# Octopod
This package provides a handy tool for interacting with the [Octopus Energy REST API](https://developer.octopus.energy/rest/).

This is still in the early stages of development and as such, currently provides only basic functionality (Currently only `getProducts` and `getAccount` are supported).

# Installation
Add the following line to your pubspec.yaml file:

```yaml
dependencies:
  octopod: ^0.1.3
```

# Usage
```dart
import 'package:flutter/material.dart';
import 'package:octopod/octopod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _octopod = Octopod(apiKey: '<api-key>');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async => await _octopod.getProducts(),
          child: const Text('Get Products'),
        ),
      ),
    );
  }
}

```