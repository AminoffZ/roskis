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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInManualPage extends StatefulWidget {
  const SignInManualPage({super.key});
  @override
  State<StatefulWidget> createState() => _SignInManualPageState();
}

class _SignInManualPageState extends State<SignInManualPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // TODO: implement sign in
  _signIn(BuildContext context) {
    print(_emailController.text);
    print(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In With Email')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SignInManualForm(_emailController, _passwordController),
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _SignInManualForm extends StatelessWidget {
  const _SignInManualForm(this._emailController, this._passwordController);
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Column(
        children: [
          _EmailField(controller: _emailController),
          const SizedBox(height: 20),
          _PasswordField(controller: _passwordController),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }
}
