import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hci_app/grouped_activities.dart';

class ChooseActivitiesPage extends StatefulWidget {
  final List<Activity> preselectedActivities;

  const ChooseActivitiesPage({Key key, this.preselectedActivities})
      : super(key: key);

  @override
  _ChooseActivitiesPageState createState() => _ChooseActivitiesPageState();
}

class _ChooseActivitiesPageState extends State<ChooseActivitiesPage> {
  final List<Activity> _selectedActivities = List<Activity>();

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
      body: _buildActivityTable(allActivities),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _sendDataBack(context),
        child: Icon(
          Icons.check,
        ),
      ),
    );
  }

  Widget _buildActivityTable(List<Activity> activities) {
    List<Widget> tiles = activities.map((activity) {
      bool alreadySelected = _selectedActivities.contains(activity);
      return ListTile(
        title: Text(activity.name),
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
    }).toList();
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
