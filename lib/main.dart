import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roskis/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roskis',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  signIn() {
    if (kDebugMode) {
      print("Sign in");
    }
  }

  createAccount() {
    if (kDebugMode) {
      print("Create account");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roskis')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: signIn, child: const Text("Sign In")),
          TextButton(
              onPressed: createAccount, child: const Text("Create Account")),
        ],
      )),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RoskisMap(),
    );
  }
}
