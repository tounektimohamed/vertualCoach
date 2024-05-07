import 'package:flutter/material.dart';
import 'package:mohamed/game.dart';
import 'package:mohamed/games/celebrity.dart';
import 'package:mohamed/games/pattern1.dart';
import 'package:mohamed/games/simon.dart';
import 'choice.dart';

class GameChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChoiceScreen()),
          (Route<dynamic> route) => false,
        );
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 196, 208, 235),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.09,
              horizontal: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Choose a Game',
                  textAlign: TextAlign.center,
                ),
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.36,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: AssetImage('images/ghosts.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.41,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ColorWordGameScreen(),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 80,
                            ),
                            child: ListTile(
                              title: Text(
                                "Play Simon",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.36,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: AssetImage('images/epic_gamer.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.41,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CelebrityGame(fromChooseGame: true),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 80,
                            ),
                            child: ListTile(
                              title: Text(
                                "Identify 'Them'",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.36,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            image: DecorationImage(
                              image: AssetImage('images/sneak_peek.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.41,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Pattern(fromChooseGame: true),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.0),
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 80,
                            ),
                            child: ListTile(
                              title: Text(
                                "Solve Riddles",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
