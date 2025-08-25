// lib/models/todo.dart
class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({required this.id, required this.title, this.completed = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'] ?? false,
    );
  }
}
