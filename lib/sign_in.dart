import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  _oauthSignIn(_OAuthProvider provider) {
    if (kDebugMode) {
      print("Sign in with: ${provider.toString().split('.').last}");
    }
  }

  _manualSignIn(BuildContext context) {
    context.push('/sign-in/manual');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Theme(
        data: ThemeData(
          iconTheme: const IconThemeData(size: 84),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 48,
                  children: [
                    IconButton(
                      onPressed: () => _oauthSignIn(_OAuthProvider.facebook),
                      icon: const Icon(Icons.abc),
                    ),
                    IconButton(
                      onPressed: () => _oauthSignIn(_OAuthProvider.google),
                      icon: const Icon(Icons.luggage),
                    ),
                    IconButton(
                      onPressed: () => _oauthSignIn(_OAuthProvider.github),
                      icon: const Icon(Icons.mouse),
                    ),
                    IconButton(
                      onPressed: () => _oauthSignIn(_OAuthProvider.twitter),
                      icon: const Icon(Icons.login),
                    ),
                    IconButton(
                      onPressed: () => _oauthSignIn(_OAuthProvider.reddit),
                      icon: const Icon(Icons.shield),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: TextButton(
                    onPressed: () => _manualSignIn(context),
                    child: const Text("Sign In With Email"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInManualPage extends StatelessWidget {
  const SignInManualPage({super.key});

  // TODO: implement sign in
  _signIn(BuildContext context) {
    print("Manual Sign In");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In With Email')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _SignInManualForm(),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => _signIn(context),
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInManualForm extends StatelessWidget {
  const _SignInManualForm();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Column(
        children: [
          _EmailField(),
          SizedBox(height: 20),
          _PasswordField(),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }
}
