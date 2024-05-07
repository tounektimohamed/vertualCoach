import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohamed/auth/auth_page.dart';
import 'package:mohamed/screens2/dashboard.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Si l'utilisateur est connecté, afficher le tableau de bord
          if (snapshot.hasData) {
            return const Dashboard();
          } else {
            // Si l'utilisateur n'est pas connecté, afficher la page d'authentification
            return const AuthPage();
          }
        },
      ),
    );
  }
}
