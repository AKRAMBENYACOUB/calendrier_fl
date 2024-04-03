class Activity {
  String title;
  String description;
  DateTime dateTime;
  String location;

  Activity({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.location,
  });
}

class User {
  String name;
  String email;

  User({
    required this.name,
    required this.email,
  });
}

class Feedback {
  String comment;
  int rating;

  Feedback({
    required this.comment,
    required this.rating,
  });
}

// Ajoutez d'autres classes au besoin
