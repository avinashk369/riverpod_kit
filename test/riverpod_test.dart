import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_kit/features/counter/providers/word_count_provider.dart';
import 'package:riverpod_kit/features/quote/provider/quote_provider.dart';

void main() {
  test('wordCountProvider returns the correct word count for the quote', () {
    // Create a ProviderContainer and override the dependency.
    final container = ProviderContainer(
      overrides: [
        // Provide a mock value for the quoteProvider.
      ],
    );

    // Read the provider we are testing.
    final wordCount = container.read(wordCountProvider);
    print(" Word Count: $wordCount  ");
    // Assert the result.
    expect(wordCount, 2);
  });
}
