// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

import 'package:mohamed/video_conference_page.dart';

class HomeCall extends StatefulWidget {
  const HomeCall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeCall> {
  /// Users who use the same conferenceID can in the same conference.
  var conferenceDTextCtrl = TextEditingController(text: 'video_conference_id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: conferenceDTextCtrl,
                  decoration: const InputDecoration(
                      labelText: 'join a conference by id'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return VideoConferencePage(
                          conferenceID: conferenceDTextCtrl.text.trim(),
                        );
                      }),
                    );
                  },
                  child: const Text('join'))
            ],
          ),
        ),
      ),
    );
  }
}
