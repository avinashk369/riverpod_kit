// lib/providers/todos_provider.dart
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/features/todo/data/todo_model.dart';

part 'todos.g.dart';

@riverpod
class Todos extends _$Todos {
  // `build` is now asynchronous and returns a `Future<List<Todo>>`.
  @override
  Future<List<Todo>> build() async {
    return fetchTodos();
  }

  // Initial data fetching
  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=5'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Todo.fromJson(item)).toList();
    }
    throw Exception('Failed to load todos');
  }

  // Method to add a new todo
  Future<void> addTodo(String title) async {
    // 1. Set the state to `AsyncLoading` to show a progress indicator.
    // We get the current list from the `state` property to re-use it.
    state = const AsyncValue.loading();

    // 2. Perform the asynchronous operation (API call).
    try {
      final newTodo = Todo(id: 99, title: title, completed: false);
      // Simulate an API call delay.
      await Future.delayed(const Duration(seconds: 1));

      // 3. Update the state with the new data.
      // We read the current list from the previous state and add the new todo.
      state = AsyncValue.data([...state.value!, newTodo]);

      // 4. (Optional) In a real app, you would make an API POST request
      // and update the state with the returned item.
      // final response = await http.post(...);
      // final newTodo = Todo.fromJson(json.decode(response.body));
      // state = AsyncValue.data([...state.value!, newTodo]);
    } catch (e, st) {
      // 5. If an error occurs, update the state to an error state.
      state = AsyncValue.error(e, st);
    }
  }
}

@riverpod
Todo todo(Ref ref, int todoId) {
  // We watch the todosNotifierProvider.
  // When the list of todos changes, this provider will automatically rebuild.
  final todos = ref.watch(todosProvider).requireValue;

  // Find the single todo that matches the provided ID.
  return todos.firstWhere((todo) => todo.id == todoId);
}
