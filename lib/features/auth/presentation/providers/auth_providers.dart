import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/auth/data/model/user_model.dart';

final authProvider =
    StateNotifierProvider<AuthProviders, AsyncValue<UserModel>?>(
      (_) => AuthProviders(),
    );

class AuthProviders extends StateNotifier<AsyncValue<UserModel>?> {
  AuthProviders() : super(null);

  Future<void> signIn(String email, String password) async {
    // Implement sign-in logic here
    state = AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = AsyncValue.data(UserModel("1", "email"));
  }
}
