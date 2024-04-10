import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaccilanka_mobile_application_development/pages/home.dart';
import 'package:vaccilanka_mobile_application_development/pages/services/session_manager.dart';
import 'package:vaccilanka_mobile_application_development/utils/custom_snack.dart';
import 'package:vaccilanka_mobile_application_development/utils/loading_animation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      CustomSnackbar.showWarning(context, 'Please fill in all fields');
      return;
    }

    try {
      showLoadingAnimation(context);

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      if (userCredential.user != null) {

        SessionManager().setUserId(userCredential.user!.uid);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        CustomSnackbar.showWarning(context, 'No user found for the provided credentials');
      }
    } on FirebaseAuthException catch (e) {
      CustomSnackbar.showWarning(context, e.message ?? 'An error occurred');
    } finally {
      closeLoadingAnimation(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 216, 228),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/logo.png",
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'VACCILANKA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 24, 135, 226),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'User Login',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {

              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 148, 186, 218),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
