import 'package:flutter/material.dart';
import 'package:hci_app/activities_page.dart';
import 'package:hci_app/patients_page.dart';

class BottomNavigationBarController extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  int _selectedPageIndex = 0;

  final PageStorageBucket bucket = PageStorageBucket();

  final _pageOptions = <Widget>[
    PatientsPage(
      key: PageStorageKey('PatientsPage'),
    ),
    ActivitiesPage(
      key: PageStorageKey('ActivitiesPage'),
    ),
  ];

  Widget _bottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      onTap: (int index) => setState(() => _selectedPageIndex = index),
      currentIndex: selectedIndex,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedPageIndex),
      body: PageStorage(
        child: _pageOptions[_selectedPageIndex],
        bucket: bucket,
      ),
    );
  }

  // ignore: unused_element
  Widget _oldbuild(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('hci-app'),
          ),
          body: _pageOptions[_selectedPageIndex],
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
