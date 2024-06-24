import 'package:auto_parts_app/pages/login_page.dart';
import 'package:auto_parts_app/pages/tabs/tabs_navigation.dart';
import 'package:auto_parts_app/utils/constants.dart';
import 'package:auto_parts_app/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _checkTokenAndNavigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkTokenAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    SecureStorage secureStorage =
        SecureStorage(); // Simulate a delay for splash screen
    String? token = await secureStorage.readSecureData('auth_token');

    if (token != null && token.isNotEmpty) {
      // Token is present, navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TabsNavigation()),
      );
    } else {
      // Token is not present, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Text(
            'Global Parts',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Constants.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
