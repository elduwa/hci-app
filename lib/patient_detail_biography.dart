import 'package:flutter/material.dart';

class PatientDetailBiography extends StatelessWidget {
  final List<String> medicalHistory;
  final List<String> background;
  final String imgPath;

  PatientDetailBiography({
    @required this.medicalHistory,
    @required this.background,
    @required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: Image.asset(
            this.imgPath,
            height: 200,
            width: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 5),
          child: ListTile(
            title: Text(
              'Medical History',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              this.medicalHistory.map((x) => " • " + x).join("\n"),
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 5, 40, 20),
          child: ListTile(
            title: Text(
              'Background',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              this.background.map((x) => " • " + x).join("\n"),
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
