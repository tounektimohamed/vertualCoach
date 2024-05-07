import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

class MessageListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Messages'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Général'),
              Tab(text: 'Proximité'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _GeneralMessagesTab(),
            _NearbyMessagesTab(),
          ],
        ),
      ),
    );
  }
}

class _GeneralMessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Aucun message'));
          }
          // Filtrer les données côté client si nécessaire
          List<DocumentSnapshot> filteredMessages = snapshot.data!.docs
              .where((message) =>
                  message['latitude'] == null && message['longitude'] == null)
              .toList();

          return ListView.builder(
            itemCount:
                filteredMessages.length < 5 ? filteredMessages.length : 5,
            itemBuilder: (context, index) {
              DocumentSnapshot message = filteredMessages[index];
              return ListTile(
                title: Text(message['content']),
                subtitle:
                    Text('Envoyé le ${_formatTimestamp(message['timestamp'])}'),
                trailing: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: message['content']));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Message copié avec succès'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Fermer',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _NearbyMessagesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
          if (userSnapshot == null ||
              userSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (userSnapshot.hasError) {
            return Center(child: Text('Error: ${userSnapshot.error}'));
          }
          if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
            return Center(child: Text('User not found'));
          }

          double? userLatitude = userSnapshot.data!['latitude'] as double?;
          double? userLongitude = userSnapshot.data!['longitude'] as double?;

          return StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('messages').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot == null ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              // Check if there are no messages in the nearby tab
              if (snapshot.data?.docs.isEmpty ?? true) {
                return Center(child: Text('You have no messages yet'));
              }

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot message = snapshot.data!.docs[index];
                  double? messageLatitude = message['latitude'] as double?;
                  double? messageLongitude = message['longitude'] as double?;
                  if (messageLatitude != null &&
                      messageLongitude != null &&
                      userLatitude != null &&
                      userLongitude != null) {
                    double distanceInMeters = Geolocator.distanceBetween(
                      userLatitude,
                      userLongitude,
                      messageLatitude,
                      messageLongitude,
                    );

                    // Display only messages sent by other users and within 1000 meters
                    if (distanceInMeters <= 1000 &&
                        message['senderId'] !=
                            FirebaseAuth.instance.currentUser!.uid) {
                      // Check if the message was received by the current user
                      String userId = FirebaseAuth.instance.currentUser!.uid;
                      bool receivedByUser = message['receiverId'] == userId;

                      return ListTile(
                        title: Text(message['content']),
                        subtitle: Text(
                            'Distance: ${distanceInMeters.toStringAsFixed(2)} meters'),
                        trailing: receivedByUser ? Icon(Icons.check) : null,
                      );
                    } else {
                      return SizedBox
                          .shrink(); // Hide messages that don't meet the criteria
                    }
                  } else {
                    return SizedBox
                        .shrink(); // Ignore messages without latitude or longitude
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}

String _formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}:${dateTime.minute}';
}

void main() {
  runApp(MaterialApp(
    home: MessageListPage(),
  ));
}
