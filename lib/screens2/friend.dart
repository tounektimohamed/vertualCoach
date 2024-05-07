import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class NearbyFriendsPage extends StatefulWidget {
  @override
  _NearbyFriendsPageState createState() => _NearbyFriendsPageState();
}

class _NearbyFriendsPageState extends State<NearbyFriendsPage> {
  List<Map<String, dynamic>> nearbyUsers = [];
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentPosition = position;
    });
    getUsersNearby(position.latitude, position.longitude);
  }

  void getUsersNearby(double latitude, double longitude) async {
    double radiusInMeters = 1000; // 1 kilometer
    var collection = FirebaseFirestore.instance.collection('Users');
    var querySnapshot = await collection.get();
    var nearbyUsersList = <Map<String, dynamic>>[];
    querySnapshot.docs.forEach((document) {
      var userData = document.data() as Map<String, dynamic>;
      var userLatitude = userData['latitude'];
      var userLongitude = userData['longitude'];

      if (userLatitude != null && userLongitude != null) {
        double distanceInMeters = Geolocator.distanceBetween(
          latitude,
          longitude,
          userLatitude,
          userLongitude,
        );
        if (distanceInMeters <= radiusInMeters) {
          userData['distance'] = distanceInMeters;
          nearbyUsersList.add(userData);
        }
      }
    });
    setState(() {
      nearbyUsers = nearbyUsersList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Friends'),
      ),
      body: Column(
        children: <Widget>[
          if (currentPosition != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your current location: ${currentPosition!.latitude}, ${currentPosition!.longitude}',
                style: TextStyle(fontSize: 16),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: nearbyUsers.length,
              itemBuilder: (context, index) {
                var user = nearbyUsers[index];
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                  child: ListTile(
                    title: Text(
                      user['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Distance: ${user['distance']} meters',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
