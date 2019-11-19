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
  var _selectedPageIndex = 0;
  final _pageOptions = <Widget>[
    PatientsPage(),
    ActivitiesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('hci-app'),
          ),
          body: _pageOptions[_selectedPageIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('Patients'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note),
                title: Text('Activities'),
              ),
            ],
          ),
        ));
  }
}
