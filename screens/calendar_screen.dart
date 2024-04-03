import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/activity.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  List<Activity> _activities = [];

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    _fetchActivities();
  }

  bool isSameDay(DateTime dayA, DateTime dayB) {
    return dayA.year == dayB.year && dayA.month == dayB.month && dayA.day == dayB.day;
  }

  void _fetchActivities() {
    setState(() {
      _activities = [
        Activity(
          title: 'Activité 1',
          description: 'Description de l\'activité 1',
          dateTime: DateTime.now().subtract(Duration(days: 2)),
          location: 'Localisation de l\'activité 1',
        ),
        Activity(
          title: 'Activité 2',
          description: 'Description de l\'activité 2',
          dateTime: DateTime.now().subtract(Duration(days: 1)),
          location: 'Localisation de l\'activité 2',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier des activités'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
            ),
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Activités du ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _activities.length,
              itemBuilder: (context, index) {
                if (isSameDay(_activities[index].dateTime, _selectedDay)) {
                  return ListTile(
                    title: Text(_activities[index].title),
                    subtitle: Text(_activities[index].description),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
