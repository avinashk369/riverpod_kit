import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  Future<String> build({required int userId, required String userName}) async {
    return fetchUser();
  }

  Future<String> fetchUser() async {
    // Simulate a network delay for better visualization of the loading state.
    await Future.delayed(const Duration(seconds: 2));

    try {
      return "Fetching user...";
    } catch (e) {
      // Catch any network errors.
      throw Exception('Failed to load user: $e');
    }
  }
}

// @riverpod
// Future<String> userDetails(
//   Ref ref,
//   ({int userId, String categoryId}) params,
// ) async {
//   return "";
// }
