import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lockboot/auth/login_screen.dart';

class SplashServices {
  void islogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }
}
