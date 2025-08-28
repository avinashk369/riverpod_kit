class Todo {
  final String id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});

  // A copyWith method is useful for creating a new instance with updated properties.
  Todo copyWith({String? id, String? title, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  // Method to convert a Todo object into a JSON-formatted Map.
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'completed': completed};
  }

  // A factory method to create a Todo object from a JSON-formatted Map.
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
