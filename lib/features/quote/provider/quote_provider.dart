import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'quote_provider.g.dart';

@riverpod
class Quote extends _$Quote {
  @override
  Future<String> build() async {
    return fetchQuote();
  }

  Future<String> fetchQuote() async {
    // Simulate a network delay for better visualization of the loading state.
    await Future.delayed(const Duration(seconds: 2));

    try {
      return "Fetching quote...";
    } catch (e) {
      // Catch any network errors.
      throw Exception('Failed to load quote: $e');
    }
  }

  // A method to refresh the quote.
  void refreshQuote() {
    // `state` is of type `AsyncValue<String>`. Calling this method tells
    // Riverpod to re-run the `build` method.
    state = const AsyncValue.loading();
    // Alternatively, you can invalidate the provider to trigger a full rebuild.
    ref.invalidateSelf();
  }
}
