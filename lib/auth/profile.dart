import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  _signIn(BuildContext context) {
    context.push('/profile/sign-in');
  }

  _createAccount(BuildContext context) {
    context.push('/profile/create-account');
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
