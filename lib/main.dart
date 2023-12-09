import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roskis/auth/create_account.dart';
import 'package:roskis/auth/profile.dart';
import 'package:roskis/auth/sign_in.dart';
import 'package:roskis/map.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MapPage()),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/profile/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/profile/sign-in/manual',
      builder: (context, state) => SignInManualPage(),
    ),
    GoRoute(
      path: '/profile/create-account',
      builder: (context, state) => const CreateAccountPage(),
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
