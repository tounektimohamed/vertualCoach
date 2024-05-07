import 'package:flutter/material.dart';
import 'package:mohamed/game.dart';
import 'package:mohamed/screens2/friend.dart';
import 'package:mohamed/voix/SoundWaveIndicator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoicePage extends StatefulWidget {
  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _recognizedWords = '';

  List<String> _availableCommands = [
    'Display Friend Lists',
    'Select Memory Game',
    // Add more commands here
  ];

  @override
  void initState() {
    super.initState();
    _initSpeechRecognizer();
  }

  void _initSpeechRecognizer() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );
    if (available) {
      print('Speech recognizer initialized successfully');
    } else {
      print('Error: Speech recognizer not available');
    }
  }

  void _startListening() {
    if (!_isListening) {
      _speech.listen(
        onResult: (result) {
          print(
              'Texte reconnu: ${result.recognizedWords}'); // Ajout du message de débogage

          if (result.finalResult) {
            setState(() {
              _recognizedWords = result.recognizedWords.toLowerCase();
            });
            _handleVoiceCommand(_recognizedWords);
          }
        },
      );
      setState(() {
        _isListening = true;
      });
    }
  }

  void _stopListening() {
    if (_isListening) {
      _speech.stop();
      setState(() {
        _isListening = false;
      });
    }
  }

  void _handleVoiceCommand(String command) {
    switch (command) {
      case 'display friend lists':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NearbyFriendsPage()),
        );
        break;
      case 'select memory game':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ColorWordGameScreen()),
        );
        break;
      default:
        print('Unrecognized voice command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Recognition'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Voice Commands',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Display Friend Lists'),
              onTap: () {
                _handleVoiceCommand('display friend lists');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Select Memory Game'),
              onTap: () {
                _handleVoiceCommand('select memory game');
                Navigator.pop(context);
              },
            ),
            // Add more list tiles for additional commands
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isListening
                ? Icon(
                    Icons.mic,
                    size: 80,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.mic_none,
                    size: 80,
                    color: Colors.grey,
                  ),
            SizedBox(height: 20),
            _isListening
                ? Text(
                    'Listening...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Press the button to speak',
                    style: TextStyle(fontSize: 20),
                  ),
            SizedBox(height: 20),
            Text(
              _recognizedWords,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isListening ? _stopListening : _startListening,
        child: Icon(_isListening ? Icons.stop : Icons.mic),
      ),
    );
  }
}
