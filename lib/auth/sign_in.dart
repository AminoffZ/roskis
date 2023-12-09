import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roskis/auth/validate_email.dart';

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
    context.push('/profile/sign-in/manual');
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

class SignInManualPage extends StatelessWidget {
  SignInManualPage({super.key});

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  // TODO: implement sign in
  _signIn(BuildContext context) {
    if (_emailKey.currentState!.validate() &&
        _passwordKey.currentState!.validate()) {
      if (kDebugMode) {
        print("Sign in with email");
      }
    } else {
      // TODO: Stop spam on multiple errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fix the errors")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In With Email')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SignInManualForm(_emailKey, _passwordKey),
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
  const _SignInManualForm(this._emailKey, this._passwordKey);
  final GlobalKey<FormFieldState> _emailKey;
  final GlobalKey<FormFieldState> _passwordKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Column(
        children: [
          _EmailField(_emailKey),
          const SizedBox(height: 20),
          _PasswordField(_passwordKey),
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField(this._emailKey);
  final GlobalKey<FormFieldState> _emailKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _emailKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateEmail,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField(this._passwordKey);
  final GlobalKey<FormFieldState> _passwordKey;

  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscureText = true;

  _toggleObscure() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: widget._passwordKey,
          obscureText: _obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: _toggleObscure,
              icon: _obscureText
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
          ),
        ),
      ],
    );
  }
}
