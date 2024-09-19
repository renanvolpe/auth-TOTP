import 'package:flutter/material.dart';
import 'package:flutter_dev_test/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
 runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dev Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
    );
  }
}
