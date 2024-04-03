import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback des activités'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donnez votre feedback sur les activités:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Entrez votre commentaire ici...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Notez l\'expérience:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.sentiment_very_dissatisfied, size: 40, color: Colors.red),
                SizedBox(width: 10),
                Icon(Icons.sentiment_dissatisfied, size: 40, color: Colors.orange),
                SizedBox(width: 10),
                Icon(Icons.sentiment_neutral, size: 40, color: Colors.yellow),
                SizedBox(width: 10),
                Icon(Icons.sentiment_satisfied, size: 40, color: Colors.lightGreen),
                SizedBox(width: 10),
                Icon(Icons.sentiment_very_satisfied, size: 40, color: Colors.green),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Mettre en œuvre la logique pour soumettre le feedback
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}

