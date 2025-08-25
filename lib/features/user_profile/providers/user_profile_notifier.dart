import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/features/user_profile/data/user_profile.dart';
part 'user_profile_notifier.g.dart';

@riverpod
class UserProfileNotifier extends _$UserProfileNotifier {
  @override
  UserProfile build() {
    return UserProfile(
      name: 'John Doe',
      email: 'john.doe@example.com',
      age: 30,
    );
  }

  void updateAge(int newAge) {
    state = state.copyWith(age: newAge);
  }

  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }
}
