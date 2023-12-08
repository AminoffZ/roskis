import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  // TODO: implement create account
  _createAccount() {
    if (kDebugMode) {
      print("Sign in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
          iconTheme: const IconThemeData(size: 84),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: input fields
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createAccount,
                child: const Text("Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
