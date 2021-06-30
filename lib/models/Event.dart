class Event {
  int id = -1;
  String name = "";
  DateTime date = DateTime.now();

  Event({id, name, date});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      date: DateTime.parse(json['date']),
    );
  }
}
