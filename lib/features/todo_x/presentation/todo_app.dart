import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/todo_x/data/todo_model.dart';
import 'package:riverpod_kit/features/todo_x/presentation/todo_list_screen.dart';
import 'package:riverpod_kit/features/todo_x/providers/todos_notifier_provider.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodos = ref.watch(todosNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod To-Do List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: switch (asyncTodos) {
          AsyncData(:final value) => TodoList(todos: value),
          AsyncError(:final error) => Text('Error: $error'),
          AsyncLoading() => const CircularProgressIndicator(),
          // TODO: Handle this case.
          AsyncValue<List<Todo>>() => throw UnimplementedError(),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context, ref);
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New To-Do'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter to-do title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  ref
                      .read(todosNotifierProvider.notifier)
                      .addTodo(controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
