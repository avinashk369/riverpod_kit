import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_posts.g.dart';

@riverpod
Future<List<String>> userPosts(Ref ref, int userId) async {
  // ... (API call for user posts)
  return ['First Post', 'Second Post'];
}
