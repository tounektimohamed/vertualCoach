import 'package:flutter/material.dart';

class SimonHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How to Play',
          
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text('''1. Wait for a button to light up.''',
                ),
            Text('''2. Tap the button that just lit up.''',
            ),
            Text('''3. Wait for the next button to light up.''',
               ),
            Text('''4. Tap the two buttons in the sequence that they lit up.''',
        ),
            Text(
                '''5. The game will continue similarly for a few levels until the user messes up or clears all the levels.''',
                ),
            Text(
                '''6. If you're able to advance to level 7, you can proceed to the next game in the test if you like.''',
              ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/nintendo_2x.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
