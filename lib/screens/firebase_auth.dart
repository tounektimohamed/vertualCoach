import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'register.dart';
import 'sign_in.dart';

class FireBaseAuth extends StatefulWidget {
  const FireBaseAuth({Key? key}) : super(key: key);

  @override
  State<FireBaseAuth> createState() => _FireBaseAuthState();
}

class _FireBaseAuthState extends State<FireBaseAuth> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.indigo[50]!],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HELLO',
                          style: GoogleFonts.b612(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Welcome to VitalAge Coach.!',
                          style: GoogleFonts.b612(
                              color: Colors.indigo[800],
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/19834.jpg', // Changer le chemin vers votre image
                    height: 200, // Ajuster la hauteur selon vos besoins
                    width: MediaQuery.of(context)
                        .size
                        .width, // Utiliser toute la largeur de l'écran
                    fit: BoxFit
                        .cover, // Ajuster l'image pour couvrir la zone spécifiée
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _isLoading ? 0.0 : 1.0,
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                        color: Colors.black26.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildButton(
                            text: "Sign in",
                            onPressed: () {
                              _pushPage(context, const SignIn());
                            },
                            backgroundColor: Colors.indigo[800],
                            textColor: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          _buildButton(
                            text: "Create an Account",
                            onPressed: () {
                              _pushPage(context, const Register());
                            },
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color? backgroundColor,
    required Color? textColor,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              _isLoading = false;
            });
            onPressed();
          });
        },
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.lato(
            color: textColor ?? Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
