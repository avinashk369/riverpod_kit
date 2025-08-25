import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/counter/providers/counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $count', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final didDecrement = ref
                        .read(counterProvider.notifier)
                        .decrement();
                    if (!didDecrement) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cannot decrement below zero!'),
                        ),
                      );
                    }
                  },
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(counterProvider.notifier).increment(),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
