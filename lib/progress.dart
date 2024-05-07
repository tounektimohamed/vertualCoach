import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Indicateur de progression circulaire avec une couleur spécifique.
Container circularProgress({Color? color}) {
  return Container(
    color: Colors.transparent,
    padding: EdgeInsets.only(top: 10.0),
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(color ?? Colors.cyan[200]),
    ),
  );
}

/// Indicateur de progression circulaire pour l'écran de chat.
Container circularProgressForChatScreen() {
  return Container(
    color: Color(0xff0d1a26),
    alignment: Alignment.center,
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.purple),
    ),
  );
}

/// Indicateur de progression personnalisé SpinKit.
Widget spinkit() {
  return SpinKitCircle(
    color: Colors.white,
    size: 20.0,
  );
}

/// Effet Shimmer pour simuler le chargement.
Container shimmerEffect() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[350]!,
      highlightColor: Colors.grey[50]!,
      enabled: true,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          6,
          (_) => Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

/// Scaffold avec un indicateur de progression spécifique.
Scaffold specialCircularProgress() {
  return Scaffold(
    body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Initializing...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Please wait a moment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 70),
              Image.asset('images/chat-features-crop_1x.png'),
              SizedBox(height: 70),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Indicateur de progression linéaire.
Container linearProgress() {
  return Container(
    padding: EdgeInsets.only(bottom: 10.0),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.purple),
    ),
  );
}
