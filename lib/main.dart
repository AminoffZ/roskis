import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:roskis/router.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    MaterialApp.router(
      routerConfig: router,
      title: 'Roskis',
      theme: ThemeData(
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(Colors.orange.value),
          ),
        ),
      ),
    ),
  );
}
