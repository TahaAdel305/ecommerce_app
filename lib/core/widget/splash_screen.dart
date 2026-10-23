import 'package:flutter/material.dart';
import '../../main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_screen.dart';
class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        final user = FirebaseAuth.instance.currentUser;

        Navigator.pushReplacementNamed(
          context,
          user != null
              ? MainScreen.routeName
              : Login_Screen.routeName,
        );
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _controller,
          child: ScaleTransition(
            scale: _controller,
              child: Image.asset(
              "assets/images/loge light.png",
                     width: double.infinity,
                      height: double.infinity,
                     fit: BoxFit.cover,
              ),
          ),
      ),
    );
}}