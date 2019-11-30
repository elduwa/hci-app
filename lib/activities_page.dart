import 'package:flutter/material.dart';
import 'package:hci_app/choose_activities_page.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final Set<Text> _chosenActivities = Set<Text>();

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
    final Iterable<ListTile> tiles = _chosenActivities.map((Text activity) {
      return ListTile(
        title: activity,
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

  void _goToChooseActivity(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseActivitiesPage(),
        ));

    setState(() {
      _chosenActivities.add(result);
    });
  }
}
