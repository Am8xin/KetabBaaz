import 'package:flutter/material.dart';
import 'package:p1/home_page_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isInvalidPassword = false;
  bool _isInvalidEmail = false;

  void _login() {
    final username = _usernameController.text.toLowerCase();
    final password = _passwordController.text;

    setState(() {
      _isInvalidPassword = !_validatePassword(password);
      _isInvalidEmail = !_validateEmail(username);
    });

    if (!_isInvalidPassword && !_isInvalidEmail) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void _forgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PasswordResetPage()),
    );
    // TODO: Implement forgot password functionality
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  bool _validatePassword(String value) {
    final username = _usernameController.text.toLowerCase();
    final password = value;

    if (password.length < 8) {
      return false;
    }

    if (password.toLowerCase() == username) {
      return false;
    }

    bool hasUpperCase = false;
    bool hasLowerCase = false;
    bool hasNumber = false;

    for (final char in password.runes) {
      if (char >= 65 && char <= 90) {
        hasUpperCase = true;
      } else if (char >= 97 && char <= 122) {
        hasLowerCase = true;
      } else if (char >= 48 && char <= 57) {
        hasNumber = true;
      }
    }

    return hasUpperCase && hasLowerCase && hasNumber;
  }



  bool _validateEmail(String value) {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );
    return emailRegex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            if (_isInvalidPassword && _isInvalidEmail)
              const Text(
                'Invalid email and password!',
                style: TextStyle(color: Colors.red),
              )
            else if (_isInvalidPassword)
              const Text(
                'Invalid password!',
                style: TextStyle(color: Colors.brown),
              )
            else if (_isInvalidEmail)
                const Text(
                  'Invalid email!',
                  style: TextStyle(color: Colors.deepPurple),
                ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: _forgotPassword,
              child: const Text('You Forget Your Password?'),
            ),
            TextButton(
              onPressed: _navigateToSignUp,
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
