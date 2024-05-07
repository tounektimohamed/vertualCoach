import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mohamed/screens2/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
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
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to E-coch',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'If you want to use TELE-vertical coach slide on the right',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              // Ajoutez l'image ici
              Image.asset(
                'assets/bg.png',
                width: 200, // Ajustez la largeur selon vos besoins
                height: 200, // Ajustez la hauteur selon vos besoins
                fit: BoxFit
                    .contain, // Ajustez le mode d'ajustement selon vos besoins
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                child: const Text(' Alternative Sign In '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
