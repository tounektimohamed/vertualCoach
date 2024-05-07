import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mohamed/chat/home_page.dart';
import 'package:mohamed/choice.dart';
import 'package:mohamed/dashboard.dart';
import 'package:mohamed/features/landing/screens/landing_screen.dart';
import 'package:mohamed/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mohamed/components/language_constants.dart';
import 'package:mohamed/game.dart';
import 'package:mohamed/home_Call.dart';
import 'package:mohamed/mobile_layout_screen.dart';
import 'package:mohamed/screens/sign_in.dart';
import 'package:mohamed/screens2/add_medication1.dart';
import 'package:mohamed/screens2/alarm_ring.dart';
import 'package:mohamed/screens2/homepage2.dart';
import 'package:mohamed/screens2/medication.dart';
import 'package:mohamed/screens2/message_list_page.dart';
import 'package:mohamed/screens2/more.dart';
import 'package:mohamed/screens2/sendmsg.dart';
import 'package:mohamed/screens2/statistic.dart';
import 'package:mohamed/voix/voix.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final user = FirebaseAuth.instance.currentUser;

  int _selectedIndex = 0;
  bool isFABvisible = true;
  bool chatBot = true;
  bool isNewMessage =
      false; // Nouvelle variable pour suivre l'état des nouveaux messages

  late List<AlarmSettings> alarms;

  static StreamSubscription? subscription;

  void loadAlarms() {
    setState(() {
      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    });
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    print('Opened ring screen');
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlarmScreen(alarmSettings: alarmSettings),
        ));
    loadAlarms();
  }

  // Méthode pour vérifier s'il y a de nouveaux messages
  void checkForNewMessages() {
    FirebaseFirestore.instance
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        // Si des documents sont retournés, il y a de nouveaux messages
        setState(() {
          isNewMessage = true;
        });
      } else {
        setState(() {
          isNewMessage = false;
        });
      }
    });
  }

  @override
  void initState() {
    loadAlarms();
    isNewMessage =
        false; // Mettre à jour l'état isNewMessage pour refléter l'absence de nouveaux messages au démarrage
    checkForNewMessages(); // Appel de la méthode pour vérifier les nouveaux messages au démarrage
    subscription ??= Alarm.ringStream.stream.listen(
      (alarmSettings) => navigateToRingScreen(alarmSettings),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const HomePage2(),
      VoicePage(),
      SendMessagePage(),
      MessageListPage(),

      // if (user != null) // If user is connected, add MobileLayoutScreen
      //   const LandingScreen(),
      // if (user == null) // If user is not connected, add LandingScreen
      const HomeCall(),
      const Statistic(),
      const More(),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: pages.elementAt(_selectedIndex),
        ),
      ),
      floatingActionButton: isFABvisible &&
              _selectedIndex !=
                  2 // Ne pas afficher sur la page de la liste des messages
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        !chatBot ? AddMedication1() : HomePage(),
                  ),
                );
              },
              backgroundColor: const Color.fromARGB(255, 14, 149, 173),
              foregroundColor: Theme.of(context).colorScheme.background,
              child: !chatBot
                  ? const Icon(Icons.add)                     
                      : const Icon(Icons.smart_toy_outlined),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(255, 242, 253, 255),
        destinations: [
          NavigationDestination(
            icon: const Icon(
              Icons.home_outlined,
            ),
            label: translation(context).home,
            selectedIcon: const Icon(
              Icons.home_rounded,
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          ),
           NavigationDestination(
            icon: const Icon(
              Icons.voice_chat,
            ),
            label: translation(context).home,
            selectedIcon: const Icon(
              Icons.voice_chat,
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.message,
            ),
            label: translation(context).sendmessage,
            selectedIcon: const Icon(
              Icons.message_outlined,
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          ),
          NavigationDestination(
            icon: isNewMessage
                ? IconButton(
                    icon: const Icon(
                      Icons.list,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        isNewMessage =
                            false; // Réinitialiser isNewMessage à false lorsque l'icône est cliquée
                      });
                    },
                  )
                : const Icon(
                    Icons.list,
                    color: Color.fromRGBO(7, 82, 96, 1),
                  ),
            label: translation(context).msglist,
            selectedIcon: isNewMessage
                ? const Icon(
                    Icons.list,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.list,
                    color: Color.fromRGBO(7, 82, 96, 1),
                  ),
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.fitness_center,
            ),
            label: translation(context).streaming,
            selectedIcon: const Icon(
              Icons.fitness_center_outlined,
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.trending_up,
            ),
            label: translation(context).statistics,
            selectedIcon: const Icon(
              Icons.trending_up,
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          ),
          NavigationDestination(
            icon: const Icon(
              Icons.dashboard_customize_outlined,
            ),
            label: translation(context).more,
            selectedIcon: const Icon(
              Icons.dashboard_customize_rounded,
              color: Color.fromRGBO(7, 82, 96, 1),
            ),
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int) {
          switch (int) {
            case 0:
              isFABvisible = false;
              chatBot = true;
              break;
            case 1:
              isFABvisible = false;
              chatBot = false;
              break;
            case 2:
              isFABvisible = false;
              chatBot = false;
              break;
            case 3:
              isFABvisible = false;
              chatBot = false;
              break;
            case 4:
              isFABvisible = false;
              chatBot = false;
              break;
            case 5:
              isFABvisible = false;
              chatBot = false;
              break;
            case 6:
              isFABvisible = false;
              chatBot = false;
              break;
          }

          setState(() {
            _selectedIndex = int;
          });
        },
      ),
    );
  }
}
