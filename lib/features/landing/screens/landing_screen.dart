import 'package:flutter/material.dart';
import 'package:mohamed/common/utils/colors.dart';
import 'package:mohamed/common/widgets/custom_button.dart';
import 'package:mohamed/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you geared up to start the sports streaming session?',
                style: TextStyle(
                  fontSize: 24, // Increased font size for older users
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/bg.png',
                height: 250,
                width: 250,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Press "Get Started" and enter your phone number.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18), // Adjusted font size for readability
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () => navigateToLoginScreen(context),
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
