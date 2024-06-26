import 'package:auto_parts_app/screens/splash_screen.dart';
import 'package:auto_parts_app/utils/constants.dart';
import 'package:auto_parts_app/utils/secure_storage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onSubmit() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if (emailController.text == "admin" &&
          passwordController.text == "flutter") {
        SecureStorage secureStorage = SecureStorage();
        secureStorage.writeSecureData("auth_token", "secureToken");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const CustomSplashScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login",
                  style: TextStyle(
                    fontSize: 28,
                  )),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Email",
                    focusColor: Constants.primaryColor,
                    prefixIcon: Icon(Icons.verified_user)),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password",
                    focusColor: Constants.primaryColor,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.verified_user)),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: onSubmit,
                    label: const Text("Login"),
                    icon: const Icon(Icons.check),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
