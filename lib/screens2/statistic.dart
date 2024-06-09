import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mohamed/components/language_constants.dart';
import 'package:mohamed/screens2/account_settings.dart';
import 'package:mohamed/screens2/add_medication1.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:week_of_year/week_of_year.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  //current user
  User? currentUser = FirebaseAuth.instance.currentUser;
  late int taken = 0;
  late int missed = 0;
  late int maximum = 0;
  late int interval = 1;

  late bool isDailyEmpty = false;
  late bool isWeekyEmpty = false;

  late List<GDPData> _chartData;
  late List<_ChartDataW> data;
  late TooltipBehavior _tooltip;
  late Color takenColor; // Color for the "Taken" series
  late Color missedColor; // Color for the "Missed" series

  Future getDailyUsage() async {
    _chartData = [];
    taken = 0;
    missed = 0;

    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .collection('Medications')
        .get(const GetOptions(source: Source.serverAndCache));

    for (final document in snapshot.docs) {
      final snapshot1 = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.email)
          .collection('Medications')
          .doc(document.reference.id)
          .collection('Logs')
          .get(const GetOptions(source: Source.serverAndCache));

      for (final document1 in snapshot1.docs) {
        // print('Date ID: ${document1.reference.id}');
        List<String> dateTime = document1.reference.id.split(' ');
        //check today
        List<String> date = dateTime[0].split('-');
        int year = int.parse(date[0]);
        int month = int.parse(date[1]);
        int day = int.parse(date[2]);
        final now = DateTime.now();

        if (DateTime(year, month, day) ==
            DateTime(now.year, now.month, now.day)) {
          final snapshot2 = await FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser!.email)
              .collection('Medications')
              .doc(document.reference.id)
              .collection('Logs')
              .doc(document1.reference.id)
              .get(const GetOptions(source: Source.serverAndCache));

          Map<String, dynamic>? logData = snapshot2.data() != null
              ? snapshot2.data() as Map<String, dynamic>
              : <String, dynamic>{};
          bool? isTaken = logData['isTaken'];
          if (isTaken!) {
            taken++;
          } else {
            missed++;
          }
        }
      }
    }
    _chartData = [
      GDPData('Taken', taken),
      GDPData('Skipped', missed),
    ];
    print('Taken: $taken');
    print('Missed: $missed');

    if (taken == 0 && missed == 0) {
      setState(() {
        isDailyEmpty = true;
      });
    }
  }

  Future getWeeklyUsage() async {
    data = [];
    int max = 0;
    maximum = 0;
    interval = 1;

    int monTaken = 0;
    int monMissed = 0;

    int tueTaken = 0;
    int tueMissed = 0;

    int wedTaken = 0;
    int wedMissed = 0;

    int thuTaken = 0;
    int thuMissed = 0;

    int friTaken = 0;
    int friMissed = 0;

    int satTaken = 0;
    int satMissed = 0;

    int sunTaken = 0;
    int sunMissed = 0;

    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .collection('Medications')
        .get(const GetOptions(source: Source.serverAndCache));

    for (final document in snapshot.docs) {
      final snapshot1 = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser!.email)
          .collection('Medications')
          .doc(document.reference.id)
          .collection('Logs')
          .get(const GetOptions(source: Source.serverAndCache));

      for (final document1 in snapshot1.docs) {
        // print('Date ID: ${document1.reference.id}');
        List<String> dateTime = document1.reference.id.split(' ');
        //check today
        List<String> date = dateTime[0].split('-');
        int year = int.parse(date[0]);
        int month = int.parse(date[1]);
        int day = int.parse(date[2]);
        final dbDate = DateTime(year, month, day);
        int weekday = dbDate.weekday;

        final now = DateTime.now();
        final currentWeek = now.weekOfYear;
        Duration difference = dbDate.difference(DateTime.now());
        print('Difference: $difference');

        if ((dbDate.weekOfYear == currentWeek) && difference.isNegative) {
          final snapshot2 = await FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser!.email)
              .collection('Medications')
              .doc(document.reference.id)
              .collection('Logs')
              .doc(document1.reference.id)
              .get(const GetOptions(source: Source.serverAndCache));

          Map<String, dynamic>? logData = snapshot2.data() != null
              ? snapshot2.data() as Map<String, dynamic>
              : <String, dynamic>{};
          bool? isTaken = logData['isTaken'];

          switch (weekday) {
            case 1: // Monday
              if (isTaken!) {
                monTaken++;
              } else {
                monMissed++;
              }
              break;
            case 2: // Tuesday
              if (isTaken!) {
                tueTaken++;
              } else {
                tueMissed++;
              }
              break;
            case 3: // Wednesday
              if (isTaken!) {
                wedTaken++;
              } else {
                wedMissed++;
              }
              break;
            case 4: // Thursday
              if (isTaken!) {
                thuTaken++;
              } else {
                thuMissed++;
              }
              break;
            case 5: // Friday
              if (isTaken!) {
                friTaken++;
              } else {
                friMissed++;
              }
              break;
            case 6: // Saturday
              if (isTaken!) {
                satTaken++;
              } else {
                satMissed++;
              }
              break;
            case 7: // Sunday
              if (isTaken!) {
                sunTaken++;
              } else {
                sunMissed++;
              }
              break;
            default:
              print("Invalid weekday!");
              break;
          }

          if (monTaken > max) {
            max = monTaken;
          } else if (monMissed > max) {
            max = monMissed;
          }

          if (tueTaken > max) {
            max = tueTaken;
          } else if (tueMissed > max) {
            max = tueMissed;
          }

          if (wedTaken > max) {
            max = wedTaken;
          } else if (wedMissed > max) {
            max = wedMissed;
          }

          if (thuTaken > max) {
            max = thuTaken;
          } else if (thuMissed > max) {
            max = thuMissed;
          }

          if (friTaken > max) {
            max = friTaken;
          } else if (friMissed > max) {
            max = friMissed;
          }

          if (satTaken > max) {
            max = satTaken;
          } else if (satMissed > max) {
            max = satMissed;
          }

          if (sunTaken > max) {
            max = sunTaken;
          } else if (sunMissed > max) {
            max = sunMissed;
          }
        }
      }
    }
    data = [
      _ChartDataW('MON', monTaken.toDouble(), monMissed.toDouble()),
      _ChartDataW('TUE', tueTaken.toDouble(), tueMissed.toDouble()),
      _ChartDataW('WED', wedTaken.toDouble(), wedMissed.toDouble()),
      _ChartDataW('THU', thuTaken.toDouble(), thuMissed.toDouble()),
      _ChartDataW('FRI', friTaken.toDouble(), friMissed.toDouble()),
      _ChartDataW('SAT', satTaken.toDouble(), satMissed.toDouble()),
      _ChartDataW('SUN', sunTaken.toDouble(), sunMissed.toDouble()),
    ];

    interval = determineInterval(max);
    maximum = calculateLeastMaxY(max, interval);

    if (max == 0) {
      setState(() {
        isWeekyEmpty = true;
      });
    }
  }

  int determineInterval(int max) {
    if (max < 5) {
      return 1;
    } else if (max < 10) {
      return 2;
    } else {
      return (max / 5).ceil();
    }
  }

  int calculateLeastMaxY(int max, int interval) {
    return ((max + interval - 1) ~/ interval) * interval;
  }

  @override
  void initState() {
    _chartData = [];
    data = [];
    _tooltip = TooltipBehavior(enable: true);
    takenColor = const Color.fromRGBO(35, 193, 250, 1); // Light Blue
    missedColor = const Color.fromRGBO(203, 63, 53, 1); // Light Red
    getDailyUsage();
    getWeeklyUsage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          translation(context).statistics,
          style: GoogleFonts.notoSans(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPageUI(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        translation(context).daily_summary,
                        style: GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    isDailyEmpty
                        ? Center(
                            child: Text(
                              'No Data Found.',
                              style: GoogleFonts.notoSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : SfCircularChart(
                            legend: Legend(isVisible: true),
                            tooltipBehavior: _tooltip,
                            series: <PieSeries<GDPData, String>>[
                              PieSeries<GDPData, String>(
                                explode: true,
                                explodeIndex: 0,
                                dataSource: _chartData,
                                xValueMapper: (GDPData data, _) => data.continent,
                                yValueMapper: (GDPData data, _) => data.gdp,
                                dataLabelMapper: (GDPData data, _) => data.continent,
                                dataLabelSettings: const DataLabelSettings(isVisible: true),
                                pointColorMapper: (GDPData data, _) =>
                                    data.continent == 'Taken' ? takenColor : missedColor,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        translation(context).weekly_summary,
                        style: GoogleFonts.notoSans(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    isWeekyEmpty
                        ? Center(
                            child: Text(
                              'No Data Found.',
                              style: GoogleFonts.notoSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        : SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              maximum: maximum.toDouble(),
                              interval: interval.toDouble(),
                            ),
                            tooltipBehavior: _tooltip,
                            legend: Legend(isVisible: true),
                            series: <CartesianSeries<dynamic, dynamic>>[
                              ColumnSeries<_ChartDataW, String>(
                                dataSource: data,
                                xValueMapper: (_ChartDataW data, _) => data.x,
                                yValueMapper: (_ChartDataW data, _) => data.y1,
                                name: 'Taken',
                                color: takenColor,
                              ),
                              ColumnSeries<_ChartDataW, String>(
                                dataSource: data,
                                xValueMapper: (_ChartDataW data, _) => data.x,
                                yValueMapper: (_ChartDataW data, _) => data.y2,
                                name: 'Missed',
                                color: missedColor,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

class _ChartDataW {
  _ChartDataW(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}
