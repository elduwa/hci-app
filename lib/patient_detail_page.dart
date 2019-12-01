import 'package:flutter/material.dart';
import 'package:hci_app/pateint_detail_calender.dart';
import 'package:hci_app/patient_detail_biography.dart';
import 'package:hci_app/patients_page.dart';

import 'patient_detail_statistics.dart';

class PatientDetailPage extends StatefulWidget {
  final Patient patient;

  PatientDetailPage({@required this.patient});
  @override
  _PatientDetailPageState createState() => _PatientDetailPageState(patient);
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  final Patient patient;
  _PatientDetailPageState(this.patient);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Biography', icon: Icon(Icons.person_pin)),
                Tab(text: 'Statistics', icon: Icon(Icons.show_chart)),
                Tab(text: 'Calender', icon: Icon(Icons.calendar_today)),
              ],
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(this.patient.firstname + " " + this.patient.lastname),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Room " + this.patient.room.toString(),
                    style: TextStyle(fontSize: 14),),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              PatientDetailBiography(
                medicalHistory: this.patient.medicalHistory,
                background: this.patient.background,
                imgPath: this.patient.imgPath,
              ),
              PatientDetailStatistics(activities: this.patient.activities),
              PatientDetailCalender(),
            ],
          ),
        ),
      ),
    );
  }
}
