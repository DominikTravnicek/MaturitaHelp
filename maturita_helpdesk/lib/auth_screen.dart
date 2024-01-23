import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showRegistrationScreen = true;

  void toggleScreens() {
    setState(() {
      showRegistrationScreen = !showRegistrationScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showRegistrationScreen) {
      return RegistrationScreen(
        showLoginScreen: toggleScreens,
      );
    } else {
      return LoginScreen(
        showRegistrationScreen: toggleScreens,
      );
    }
  }
}
