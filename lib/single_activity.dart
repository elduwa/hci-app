import 'package:flutter/material.dart';
import 'package:hci_app/grouped_activities.dart';
import 'package:hci_app/patient_detail_page.dart';
import 'package:hci_app/patients_page.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(activity.imgPath),
                  radius: 70.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Participants',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 10.0,
                thickness: 1.0,
              ),
              for (var p in activity.participants)
                Card(
                  elevation: 0,
                  color: _getMoodColor(p.mood),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.asset(
                        p.imgPath,
                      ),
                      title: Text(p.lastname + ", " + p.firstname),
                      trailing: Icon(_getMoodIcon(p.mood)),
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

  IconData _getMoodIcon(Mood mood) {
    switch (mood) {
      case Mood.good:
        return Entypo.emoji_happy;
        break;
      case Mood.bad:
        return Entypo.emoji_sad;
        break;
      case Mood.neutral:
        return Entypo.emoji_neutral;
        break;
    }
    return Entypo.emoji_neutral;
  }

  Color _getMoodColor(Mood mood) {
    switch (mood) {
      case Mood.good:
        return Colors.lightGreen;
        break;
      case Mood.bad:
        return Colors.red;
        break;
      case Mood.neutral:
        return Colors.yellow;
        break;
    }
    return Colors.white;
  }
}
