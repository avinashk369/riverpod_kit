// This provider family will now auto-dispose when it's no longer used.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/features/todo_x/data/todo_model.dart';
import 'package:riverpod_kit/features/todo_x/providers/todos_notifier_provider.dart';
part 'todo_provider.g.dart';

@Riverpod(keepAlive: false) // 'keepAlive: false' is how we apply autoDispose
Todo todo(Ref ref, String todoId) {
  // We watch the todosNotifierProvider.
  final todos = ref.watch(todosNotifierProvider).requireValue;

  // Find the single todo that matches the provided ID.
  return todos.firstWhere((todo) => todo.id == todoId);
}
