import 'package:flutter/material.dart';
import 'package:hci_app/grouped_activities.dart';

class ChooseActivitiesPage extends StatefulWidget {
  final Set<Text> preselectedActivities;

  const ChooseActivitiesPage({Key key, this.preselectedActivities})
      : super(key: key);

  @override
  _ChooseActivitiesPageState createState() => _ChooseActivitiesPageState();
}

class _ChooseActivitiesPageState extends State<ChooseActivitiesPage> {
  final Set<Text> _selectedActivities = Set<Text>();

  @override
  void initState() {
    super.initState();
    if (widget.preselectedActivities != null) {
      _selectedActivities.addAll(widget.preselectedActivities);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Today\'s Activities'),
      ),
      body: _buildActivityTable(groupedActivities),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _sendDataBack(context),
      ),
    );
  }

  Widget _buildActivityTable(Map groupedActivities) {
    Iterable<MapEntry> entries = groupedActivities.entries;
    List<Widget> groupedActivityLists = entries.map((entry) {
      List<String> values = entry.value;
      final Iterable<ListTile> tiles = values.map((activity) {
        return ListTile(
          title: Text(activity),
        );
      });
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return Column(
        children: <Widget>[
          Text(entry.key),
          ListView(
            children: divided,
            shrinkWrap: true,
          )
        ],
      );
    }).toList();

    return Column(
      children: groupedActivityLists,
    );
  }

  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, _selectedActivities);
  }
}
