import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roskis/auth/create_account.dart';
import 'package:roskis/auth/sign_in.dart';
import 'package:roskis/map.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/sign-in/manual',
      builder: (context, state) => SignInManualPage(),
    ),
    GoRoute(
      path: '/create-account',
      builder: (context, state) => const CreateAccountPage(),
    ),
    GoRoute(
      path: '/map',
      builder: (context, state) => const MapPage(),
    ),
  ],
);

void main() {
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  _signIn(BuildContext context) {
    context.push('/sign-in');
  }

  _createAccount(BuildContext context) {
    context.push('/create-account');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roskis')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _signIn(context),
              child: const Text("Sign In"),
            ),
            TextButton(
              onPressed: () => _createAccount(context),
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
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
