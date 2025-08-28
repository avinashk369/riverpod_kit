import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/todo_x/providers/todo_provider.dart';

class TodoDetailScreen extends ConsumerWidget {
  final String todoId;

  const TodoDetailScreen({required this.todoId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We use ref.watch with our new provider family.
    final todo = ref.watch(todoProvider(todoId));

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${todo.id}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Status: ${todo.completed ? 'Completed' : 'Incomplete'}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
