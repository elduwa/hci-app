import 'package:flutter/material.dart';
import 'package:hci_app/choose_activities_page.dart';
import 'package:hci_app/grouped_activities.dart';
import 'package:hci_app/single_activity.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final List<Activity> _chosenActivities = List<Activity>();

  @override
  Widget build(BuildContext context) {
    //context.owner;
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _goToChooseActivity(context),
          ),
        ],
      ),
      body: _buildActivityList(),
    );
  }

  Widget _buildActivityList() {
    if (_chosenActivities.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No ongoing activities!\nTap on + in the top right corner to choose todays activities.',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      final Iterable<ListTile> tiles = _chosenActivities.map((activity) {
        return ListTile(
          title: Text(activity.name),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingleActivityPage(
                          activity: activity,
                        )));
          },
        );
      });
      final List<Widget> divided = ListTile.divideTiles(
        tiles: tiles,
        context: context,
      )
          .map((tile) => Card(
                child: tile,
              ))
          .toList();
      return ListView(
        padding: const EdgeInsets.all(16.0),
        children: divided,
      );
    }
  }

  void _goToChooseActivity(BuildContext context) {
    final result = Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseActivitiesPage(
            preselectedActivities: _chosenActivities,
          ),
        ));
    result.then((result) {
      setState(() {
        _chosenActivities.clear();
        _chosenActivities.addAll(result);
      });
    });
  }
}
