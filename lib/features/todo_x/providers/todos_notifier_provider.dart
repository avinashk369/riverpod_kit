import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/features/todo_x/data/todo_model.dart';

part 'todos_notifier_provider.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  static const _todoListKey = 'todoList';

  // Simulates an asynchronous data fetch and loads from local storage.
  Future<List<Todo>> _fetchAndLoadTodos() async {
    // final prefs = await SharedPreferences.getInstance();
    // final String? todoListString = prefs.getString(_todoListKey);
    // if (todoListString != null) {
    //   final List<dynamic> jsonList = jsonDecode(todoListString);
    //   return jsonList.map((json) => Todo.fromJson(json)).toList();
    // }
    // Return an initial list if no data is found.
    return [
      Todo(id: '1', title: 'Learn Riverpod', completed: true),
      Todo(id: '2', title: 'Build a To-Do App'),
      Todo(id: '3', title: 'Master State Management'),
    ];
  }

  // A helper method to save the current state to local storage.
  Future<void> _saveTodos(List<Todo> todos) async {
    // final prefs = await SharedPreferences.getInstance();
    // final jsonList = todos.map((todo) => todo.toJson()).toList();
    // await prefs.setString(_todoListKey, jsonEncode(jsonList));
  }

  @override
  Future<List<Todo>> build() async {
    // The build method is called once to initialize the state.
    return _fetchAndLoadTodos();
  }

  // Method to add a new to-do.
  void addTodo(String title) {
    state = state.whenData((todos) {
      final newTodo = Todo(id: DateTime.now().toIso8601String(), title: title);
      final updatedTodos = [...todos, newTodo];
      _saveTodos(updatedTodos); // Save the updated list
      return updatedTodos;
    });
  }

  // Method to toggle the completed status of a to-do.
  void toggleTodo(String id) {
    state = state.whenData((todos) {
      final updatedTodos = [
        for (final todo in todos)
          if (todo.id == id)
            todo.copyWith(completed: !todo.completed)
          else
            todo,
      ];
      _saveTodos(updatedTodos); // Save the updated list
      return updatedTodos;
    });
  }

  // Method to remove a to-do.
  void removeTodo(String id) {
    state = state.whenData((todos) {
      final updatedTodos = todos.where((todo) => todo.id != id).toList();
      // _saveTodos(updatedTodos); // Save the updated list
      return updatedTodos;
    });
  }
}
