import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  final _chosenActivities = <Text>[Text('One'), Text('Two'), Text('Three')];

  @override
  Widget build(BuildContext context) {
    context.owner;
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
        automaticallyImplyLeading: true,
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
}
