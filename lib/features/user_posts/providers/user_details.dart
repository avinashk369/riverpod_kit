import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_details.g.dart';

@riverpod
Future<String> userDetails(Ref ref, int userId) async {
  // ... (API call for user details)
  return 'John Doe';
}
