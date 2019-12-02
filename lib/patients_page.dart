import 'package:flutter/material.dart';
import 'package:hci_app/patient_detail_page.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({Key key}) : super(key: key);
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
      ),
      body: ListView(
        children: [
          for (var p in patients)
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.asset(
                    p.imgPath,
                  ),
                  title: Text(p.lastname + ", " + p.firstname),
                  trailing: Text("Room " + p.room.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientDetailPage(
                          patient: p,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
        ],
      ),
    );
  }
}

enum Mood { bad, neutral, good }

class Patient {
  final String firstname;
  final String lastname;
  final int room;
  final List<String> medicalHistory;
  final List<String> background;
  final Map<String, double> activities;
  final String imgPath;
  final Mood mood;

  Patient({
    this.firstname,
    this.lastname,
    this.room,
    this.medicalHistory,
    this.background,
    this.activities,
    this.imgPath,
    this.mood,
  });
}

List<Patient> patients = [
  Patient(
    firstname: "Katrina",
    lastname: "Meier",
    room: 142,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person1.JPG',
    mood: Mood.good,
  ),
  Patient(
    firstname: "John",
    lastname: "Doe",
    room: 121,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 3,
      "Storytelling": 2,
      "Walking": 3,
      "Movies": 5,
    },
    imgPath: 'assets/images/person2.JPG',
    mood: Mood.neutral,
  ),
  Patient(
    firstname: "Warren",
    lastname: "Bluffet",
    room: 222,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person3.JPG',
    mood: Mood.neutral,
  ),
  Patient(
    firstname: "Bill",
    lastname: "States",
    room: 198,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person4.JPG',
    mood: Mood.bad,
  ),
  Patient(
    firstname: "Morgan",
    lastname: "Streetman",
    room: 970,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person5.JPG',
    mood: Mood.good,
  ),
  Patient(
    firstname: "Judi",
    lastname: "Lench",
    room: 100,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person6.JPG',
    mood: Mood.good,
  ),
  Patient(
    firstname: "Betty",
    lastname: "Bites",
    room: 111,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person7.JPG',
    mood: Mood.bad,
  ),
  Patient(
    firstname: "Hillary",
    lastname: "Hilton",
    room: 111,
    medicalHistory: [
      "surgery for hip replacement",
      "drug allergy",
      "diagnosed very tired",
      "dental prosthesis",
    ],
    background: [
      "has always enjoyed watching movies",
      "used to be a construction worker",
      "very kind personality",
      "has 3 children",
      "traumatic childhood"
    ],
    activities: {
      "Singing": 5,
      "Storytelling": 2,
      "Walking": 10,
      "Movies": 15,
    },
    imgPath: 'assets/images/person8.JPG',
    mood: Mood.bad,
  ),
];
