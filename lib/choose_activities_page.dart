import 'package:flutter/material.dart';
import 'package:hci_app/grouped_activities.dart';

class ChooseActivitiesPage extends StatefulWidget {
  final Set<String> preselectedActivities;

  const ChooseActivitiesPage({Key key, this.preselectedActivities})
      : super(key: key);

  @override
  _ChooseActivitiesPageState createState() => _ChooseActivitiesPageState();
}

class _ChooseActivitiesPageState extends State<ChooseActivitiesPage> {
  final Set<String> _selectedActivities = Set<String>();

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
        child: Icon(
          Icons.check,
        ),
      ),
    );
  }

  Widget _buildActivityTable(Map groupedActivities) {
    Iterable<MapEntry> entries = groupedActivities.entries;
    List<String> allActivities = new List<String>();
    entries.forEach((entry) {
      allActivities.addAll(entry.value);
    });
    Set<Widget> tiles = allActivities.map((activity) {
      bool alreadySelected = _selectedActivities.contains(activity);
      return ListTile(
        title: Text(activity),
        trailing: Icon(
          alreadySelected ? Icons.check : null,
          color: Colors.black,
        ),
        onTap: () {
          setState(() {
            if (alreadySelected) {
              _selectedActivities.remove(activity);
            } else {
              _selectedActivities.add(activity);
            }
          });
        },
      );
    }).toSet();
    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
    return ListView(
      children: divided,
    );
  }

  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, _selectedActivities);
  }
}
