import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;

  // void decrement() => state > 0 ? state-- : state;
  bool decrement() {
    if (state > 0) {
      state--;
      return true; // Success
    }
    return false; // Failure
  }
}
