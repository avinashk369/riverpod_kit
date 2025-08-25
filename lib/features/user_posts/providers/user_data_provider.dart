// lib/providers/user_data_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/features/user_posts/providers/user_details.dart';
import 'package:riverpod_kit/features/user_posts/providers/user_posts.dart';
part 'user_data_provider.g.dart';

// Create a simple record to hold our combined data.
typedef UserData = ({String name, List<String> posts});

@riverpod
Future<UserData> userData(Ref ref, int userId, String userName) async {
  // Use `ref.watch` to get the **Future** from the underlying providers.
  final nameFuture = ref.watch(userDetailsProvider(userId).future);
  final postsFuture = ref.watch(userPostsProvider(userId).future);

  // AsyncValue.guard takes a Future and handles its state.
  // It returns an AsyncValue, so the provider must also return a Future.
  // The correct way is to create a new Future here that combines the results.
  return AsyncValue.guard(() async {
    final name = await nameFuture;
    final posts = await postsFuture;
    return (name: name, posts: posts);
  }).then((value) {
    // We need to return the 'value' itself, which is a UserData,
    // and let Riverpod handle the rest.
    // The previous error was that AsyncValue.guard returns an AsyncValue,
    // but the provider expected a Future.
    return value.value!;
  });
}
