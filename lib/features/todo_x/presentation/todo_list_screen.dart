import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/todo_x/data/todo_model.dart';
import 'package:riverpod_kit/features/todo_x/presentation/todo_details_screen.dart';
import 'package:riverpod_kit/features/todo_x/providers/todos_notifier_provider.dart';

class TodoList extends ConsumerWidget {
  final List<Todo> todos;

  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        // We get the ID here to use it for the select method.
        final todoId = todos[index].id;

        // Use ref.select to listen only to the completed status of this specific todo.
        final isCompleted = ref.watch(
          todosNotifierProvider.select((state) {
            // Find the specific todo item and return its completed status.
            // We use maybeWhen to handle loading/error states gracefully.
            return state.maybeWhen(
              data: (todos) =>
                  todos.firstWhere((todo) => todo.id == todoId).completed,
              orElse: () => false,
            );
          }),
        );

        final todo = todos[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TodoDetailScreen(todoId: todo.id),
              ),
            );
          },
          title: Text(
            todo.title,
            style: TextStyle(
              // The style now correctly uses the selected `isCompleted` value.
              decoration: isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Checkbox(
            value: isCompleted,
            onChanged: (value) {
              ref.read(todosNotifierProvider.notifier).toggleTodo(todo.id);
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref.read(todosNotifierProvider.notifier).removeTodo(todo.id);
            },
          ),
        );
      },
    );
  }
}
