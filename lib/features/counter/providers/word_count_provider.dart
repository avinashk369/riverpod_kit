import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/features/quote/provider/quote_provider.dart';
part 'word_count_provider.g.dart';

@riverpod
int wordCount(Ref ref) {
  final quote = ref.watch(quoteProvider); // Watching a dependency
  // Use the `.when` method to handle the data, loading, and error states.
  return quote.when(
    data: (quote) => quote.split(' ').length,
    loading: () => 0, // Return a default value while loading
    error: (err, stack) => 0, // Return a default value on error
  );
}
