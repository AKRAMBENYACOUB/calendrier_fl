import 'package:flutter/material.dart';



class MainDrawer extends StatelessWidget {
  final VoidCallback onTapActivities;
  final VoidCallback onTapRegistration;
  final VoidCallback onTapCalendar;
  final VoidCallback onTapFeedback;

  MainDrawer({
    required this.onTapActivities,
    required this.onTapRegistration,
    required this.onTapCalendar,
    required this.onTapFeedback,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Application de Suivi des Activités des Clubs Universitaires',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Liste des activités'),
            onTap: onTapActivities,
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Inscription aux activités'),
            onTap: onTapRegistration,
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Calendrier des activités'),
            onTap: onTapCalendar,
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback des activités'),
            onTap: onTapFeedback,
          ),
        ],
      ),
    );
  }
}
