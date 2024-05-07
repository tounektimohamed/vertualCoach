import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';



class ColorWordGameScreen extends StatefulWidget {
  @override
  _ColorWordGameScreenState createState() => _ColorWordGameScreenState();
}

class _ColorWordGameScreenState extends State<ColorWordGameScreen> {
  List<String> _words = [
    'ROUGE',
    'BLEU',
    'VERT',
    'JAUNE',
    'ORANGE',
    'VIOLET',
  ];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  int _currentWordIndex = 0;
  int _score = 0;
  Timer? _timer;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    _currentWordIndex = Random().nextInt(_words.length);
    _timer = Timer(Duration(minutes: 1), () {
      setState(() {
        _gameOver = true;
        _timer?.cancel();
        _showGameOverDialog();
      });
    });
  }

  void _onOptionTap(int optionIndex) {
    if (_gameOver) return;

    if (optionIndex == _colors.indexOf(_colors[_currentWordIndex])) {
      setState(() {
        _score++;
      });
    } else {
      setState(() {
        _score = max(0, _score - 1);
      });
    }

    setState(() {
      _currentWordIndex = Random().nextInt(_words.length);
    });
  }

  Future<void> _showGameOverDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Votre score: $_score',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _gameOver = false;
                  _score = 0;
                  _startGame();
                });
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildColorGrid(List<Color> colors) {
    return colors.map((color) {
      return GestureDetector(
        onTap: () => _onOptionTap(_colors.indexOf(color)),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<List<Color>> colorGroups = List.generate(
      3,
      (index) => _colors.sublist(index * 2, min((index + 1) * 2, _colors.length)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Color Word Game'),
      ),
      body: Center(
        child: _gameOver
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Game Over',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'Score: $_score',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        _gameOver = false;
                        _score = 0;
                        _startGame();
                      });
                    },
                    child: Text(
                      'Rejouer',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _words[_currentWordIndex],
                    style: TextStyle(
                      fontSize: 48,
                      color: _colors[(_currentWordIndex + 1) % _colors.length],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: colorGroups.map((colors) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildColorGrid(colors),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Score: $_score',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
