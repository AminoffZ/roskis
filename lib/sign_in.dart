import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum _OAuthProvider {
  facebook,
  google,
  github,
  twitter,
  reddit,
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  // TODO: implement sign in
  _signIn(_OAuthProvider provider) {
    if (kDebugMode) {
      print("Sign in with: ${provider.toString().split('.').last}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
          iconTheme: const IconThemeData(size: 84),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 48,
              children: [
                IconButton(
                    onPressed: () => _signIn(_OAuthProvider.facebook),
                    icon: const Icon(Icons.abc)),
                IconButton(
                  onPressed: () => _signIn(_OAuthProvider.google),
                  icon: const Icon(Icons.luggage),
                ),
                IconButton(
                    onPressed: () => _signIn(_OAuthProvider.github),
                    icon: const Icon(Icons.mouse)),
                IconButton(
                    onPressed: () => _signIn(_OAuthProvider.twitter),
                    icon: const Icon(Icons.login)),
                IconButton(
                    onPressed: () => _signIn(_OAuthProvider.reddit),
                    icon: const Icon(Icons.shield)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
