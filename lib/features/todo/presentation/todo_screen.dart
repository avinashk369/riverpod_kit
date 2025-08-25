import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/todo/providers/todos.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the AsyncNotifierProvider
    final todosAsyncValue = ref.watch(todosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Todo App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            // The invalidate method triggers a re-fetch of the initial data.
            onPressed: () => ref.invalidate(todosProvider),
          ),
        ],
      ),
      body: todosAsyncValue.when(
        data: (todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].title),
                trailing: Text('ID: ${todos[index].id}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You could show a dialog to get the new todo title.
          final newTitle = 'New Task ${DateTime.now().second}';
          // Call the method on the notifier.
          ref.read(todosProvider.notifier).addTodo(newTitle);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
