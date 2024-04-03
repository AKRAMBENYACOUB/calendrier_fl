import 'package:flutter/material.dart';
import '../models/activity.dart'; // Assurez-vous d'importer votre modèle d'activité

class ActivitiesScreen extends StatelessWidget {
  final List<Activity> activities; // Déclarez une liste d'activités comme membre de la classe

  // Modifiez le constructeur pour inclure le paramètre des activités
  ActivitiesScreen({required this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des activités'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(activities[index].title),
            subtitle: Text(activities[index].description),
            // Ajoutez d'autres détails de l'activité ici
          );
        },
      ),
    );
  }
}
