import 'package:flutter/material.dart';
import 'package:hci_app/grouped_activities.dart';
import 'package:hci_app/patient_detail_page.dart';

class SingleActivityPage extends StatelessWidget {
  final Activity activity;
  SingleActivityPage({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.name),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Overall mood: good',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                ),
              ), //TODO replace with dynamic content
              for (var p in activity.participants)
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
        ),
      ),
    );
  }
}
