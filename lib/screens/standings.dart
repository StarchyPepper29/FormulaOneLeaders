import 'package:flutter/material.dart';
import '../common/bottomnav.dart';
import '../common/sidedrawer.dart';
import '../services/f1api.dart';

class Standings extends StatefulWidget {
  const Standings({Key? key}) : super(key: key);

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  bool isDrivers = true;
  bool isConstructors = false;
  String topDriver = '';
  String topConstructor = '';
  String topDriverPoints = '';
  String topConstructorPoints = '';
  String roundNumber = '';

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  Future<void> fetchStats() async {
    Ergast ergast = Ergast();
    var drivers = await ergast.getDrivers();
    var constructors = await ergast.getConstructors();
    final roundNumber =
        drivers['MRData']['StandingsTable']['StandingsLists'][0]['round'];
    final topConstructor = constructors['MRData']['StandingsTable']
        ['StandingsLists'][0]['ConstructorStandings'][0]['Constructor']['name'];
    final topDriver = drivers['MRData']['StandingsTable']['StandingsLists'][0]
        ['DriverStandings'][0]['Driver']['givenName'];
    final topDriverPoints = drivers['MRData']['StandingsTable']
        ['StandingsLists'][0]['DriverStandings'][0]['points'];
    final topConstructorPoints = constructors['MRData']['StandingsTable']
        ['StandingsLists'][0]['ConstructorStandings'][0]['points'];
    setState(() {
      this.topDriver = topDriver;
      this.topConstructor = topConstructor;
      this.topDriverPoints = topDriverPoints;
      this.topConstructorPoints = topConstructorPoints;
      this.roundNumber = roundNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formula One Standings'),
      ),
      bottomNavigationBar: bottomNavApp(),
      drawer: SideDrawer(),
      body: Center(
        child: Column(
          children: [
            Text('Formula One 2024 Standings'),
            ToggleButtons(
              isSelected: [isDrivers, isConstructors],
              onPressed: (int index) {
                setState(() {
                  isDrivers = index == 0;
                  isConstructors = index == 1;
                });
              },
              children: [
                Text('Drivers'),
                Text('Constructors'),
              ],
            ),
            if (isDrivers)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Driver Championship Leader'),
                  Text(topDriver,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Points: $topDriverPoints after Round $roundNumber'),
                ],
              ),
            if (isConstructors)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Constructor Championship Leader'),
                  Text(topConstructor,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Points: $topConstructorPoints after Round $roundNumber'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
