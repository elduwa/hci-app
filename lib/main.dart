import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hci_app/activities_page.dart';
import 'package:hci_app/patients_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: CustomScaffold(
          scaffold: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: null,
              backgroundColor: Colors.green,
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.people,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Patients',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.event_note,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Activities',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          children: <Widget>[
            PatientsPage(),
            ActivitiesPage(),
          ],
          onItemTap: (index) {},
        ));
  }
}
