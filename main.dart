import 'package:flutter/material.dart';
import 'screens/activities_screen.dart';
import 'screens/registration_screen.dart' as RegScreen; // Utilisation d'un préfixe pour éviter le conflit de noms
import 'screens/calendar_screen.dart' as CalScreen; // Utilisation d'un préfixe pour éviter le conflit de noms
import 'screens/feedback_screen.dart';
import 'widgets/main_drawer.dart';
import '../models/activity.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  void _navigateToActivities(BuildContext context) {
    _fetchActivities(context); // Appel de la méthode pour récupérer les activités
  }

  // Méthode pour récupérer les activités à partir d'une source externe
  void _fetchActivities(BuildContext context) async {
    // Pour l'exemple, nous utilisons des données fictives
    List<Activity> activities = [
      Activity(
        title: 'Activité 1',
        description: 'Description de l\'activité 1',
        dateTime: DateTime.now(),
        location: 'Localisation de l\'activité 1',
      ),
      Activity(
        title: 'Activité 2',
        description: 'Description de l\'activité 2',
        dateTime: DateTime.now(),
        location: 'Localisation de l\'activité 2',
      ),
      // Ajoutez d'autres activités au besoin
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ActivitiesScreen(activities: activities)),
    );
  }

  void _navigateToRegistration(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegScreen.RegistrationScreen()), // Utilisation du préfixe pour accéder à RegistrationScreen
    );
  }

  void _navigateToCalendar(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalScreen.CalendarScreen()), // Utilisation du préfixe pour accéder à CalendarScreen
    );
  }

  void _navigateToFeedback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FeedbackScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suivi des Activités des Clubs Universitaires',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Suivi des Activités'),
        ),
        drawer: MainDrawer(
          onTapActivities: () {
            _navigateToActivities(context);
          },
          onTapRegistration: () {
            _navigateToRegistration(context);
          },
          onTapCalendar: () {
            _navigateToCalendar(context);
          },
          onTapFeedback: () {
            _navigateToFeedback(context);
          },
        ),
        body: Placeholder(), // Remplacez cela par le contenu de votre écran principal
      ),
    );
  }
}
