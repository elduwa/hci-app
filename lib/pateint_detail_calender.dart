import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class PatientDetailCalender extends StatefulWidget {
  @override
  _PatientDetailCalenderState createState() => _PatientDetailCalenderState();
}

class _PatientDetailCalenderState extends State<PatientDetailCalender> {
  Map<DateTime, List> _events;
  List _selectedEvents;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 1)): ['9:30 Doctor Appointment', '11:30 Family Visit', '14:00 Check Up'],
      _selectedDay.subtract(Duration(days: 3)): ['9:30 Doctor Appointment', ],
      _selectedDay.subtract(Duration(days: 6)): ['9:30 Doctor Appointment', '14:00 Family Visit'],
      _selectedDay.subtract(Duration(days: 7)): ['9:30 Doctor Appointment', '14:00 Family Visit'],
      _selectedDay.subtract(Duration(days: 11)): ['9:30 Doctor Appointment', '11:30 Family Visit', '14:00 Check Up'],
      _selectedDay.subtract(Duration(days: 17)): ['9:30 Doctor Appointment', '11:30 Family Visit'],
      _selectedDay.subtract(Duration(days: 22)): ['9:30 Doctor Appointment', ],
      _selectedDay.subtract(Duration(days: 26)): ['9:30 Doctor Appointment', '11:30 Family Visit', '14:00 Check Up'],
      _selectedDay: ['9:30 Doctor Appointment', '11:30 Family Visit'],
      _selectedDay.add(Duration(days: 1)): ['9:30 Doctor Appointment', '11:30 Family Visit', '14:00 Check Up'],
      _selectedDay.add(Duration(days: 3)): ['9:30 Doctor Appointment', ],
      _selectedDay.add(Duration(days: 6)): ['9:30 Doctor Appointment', '14:00 Family Visit'],
      _selectedDay.add(Duration(days: 7)): ['9:30 Doctor Appointment', '14:00 Family Visit'],
      _selectedDay.add(Duration(days: 11)): ['9:30 Doctor Appointment', '11:30 Family Visit', '14:00 Check Up'],
      _selectedDay.add(Duration(days: 17)): ['9:30 Doctor Appointment', '11:30 Family Visit'],
      _selectedDay.add(Duration(days: 22)): ['9:30 Doctor Appointment', ],
      _selectedDay.add(Duration(days: 26)): ['9:30 Doctor Appointment', '11:30 Family Visit', '14:00 Check Up'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      startingDayOfWeek: StartingDayOfWeek.monday,
      initialCalendarFormat: CalendarFormat.twoWeeks,
      availableCalendarFormats: const {
        CalendarFormat.twoWeeks: '2 Weeks',
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date) ? Colors.brown[300] : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
