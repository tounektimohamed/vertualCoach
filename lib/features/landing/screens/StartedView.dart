import 'package:flutter/material.dart';
import 'package:mohamed/common/colo_extension.dart';
import 'package:mohamed/common_widget/round_button.dart';
import 'package:mohamed/features/landing/screens/landing_screen.dart'; // Assurez-vous d'importer OnBoardingPage.dart

class StartedView extends StatefulWidget {
  const StartedView({Key? key}) : super(key: key);

  @override
  State<StartedView> createState() => _StartedViewState();
}

class _StartedViewState extends State<StartedView> {
  bool isChangeColor = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Container(
        width: media.width,
        decoration: BoxDecoration(
          gradient: isChangeColor
              ? LinearGradient(
                  colors: TColor.primaryG,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Fitness",
              style: TextStyle(
                color: TColor.black,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Everybody Can Train",
              style: TextStyle(
                color: TColor.gray,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  title: "Get Started",
                  type: isChangeColor
                      ? RoundButtonType.textGradient
                      : RoundButtonType.bgGradient,
                  onPressed: () {
                    if (isChangeColor) {
                      // Naviguer vers OnBoardingView lorsque le bouton est pressé
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingScreen(),
                        ),
                      );
                    } else {
                      //Change Color
                      setState(() {
                        isChangeColor = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
