import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/quote/provider/quote_provider.dart';

class QuoteScreen extends ConsumerWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.watch(quoteProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Async Quote'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: quote.isLoading
                ? null
                : () {
                    // Invalidate the provider to force a refresh.
                    ref.invalidate(quoteProvider);
                  },
          ),
        ],
      ),
      body: Center(
        // Use the `when` method to handle the different states of AsyncValue.
        child: quote.when(
          data: (quote) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Error: ${err.toString()}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
