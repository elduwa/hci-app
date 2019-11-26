import 'package:flutter/material.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({Key key}) : super(key: key);
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: insert your Scaffold here instead of Container
    return Container(
      alignment: Alignment.center,
      child: Text('Patients Page'),
    );
  }
}
