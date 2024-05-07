import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendMessagePage extends StatefulWidget {
  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final TextEditingController _messageController = TextEditingController();
  bool _sendToAllUsers = true;

  void _sendMessage() async {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      if (_sendToAllUsers) {
        // Send message to all users
        FirebaseFirestore.instance.collection('messages').add({
          'content': message,
          'senderId': FirebaseAuth.instance.currentUser!.uid,
          'latitude': null,
          'longitude': null,
          'timestamp': Timestamp.now(),
        });
      } else {
        // Get current user's position
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        double latitude = position.latitude;
        double longitude = position.longitude;

        // Send message to nearby users
        await _sendMessageToNearbyUsers(message, latitude, longitude);
      }

      _messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Message sent successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a message')),
      );
    }
  }

  Future<void> _sendMessageToNearbyUsers(
      String message, double latitude, double longitude) async {
    // Get nearby users
    QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('latitude',
            isGreaterThan: latitude - 0.01,
            isLessThan: latitude + 0.01)
        .get();

    // Exclude current user from the list of nearby users
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    usersSnapshot.docs.removeWhere((doc) => doc.id == currentUserId);

    // Send message to each nearby user
    usersSnapshot.docs.forEach((QueryDocumentSnapshot userDoc) {
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      double? userLatitude = userData?['latitude'] as double?;
      double? userLongitude = userData?['longitude'] as double?;
      if (userLatitude != null && userLongitude != null) {
        FirebaseFirestore.instance.collection('messages').add({
          'content': message,
          'senderId': FirebaseAuth.instance.currentUser!.uid,
          'latitude': latitude,
          'longitude': longitude,
          'receiverId': userDoc.id,
          'timestamp': Timestamp.now(),
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send a Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
              ),
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text('Send to all users'),
                    value: true,
                    groupValue: _sendToAllUsers,
                    onChanged: (value) {
                      setState(() {
                        _sendToAllUsers = value as bool;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('Send to nearby users'),
                    value: false,
                    groupValue: _sendToAllUsers,
                    onChanged: (value) {
                      setState(() {
                        _sendToAllUsers = value as bool;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
