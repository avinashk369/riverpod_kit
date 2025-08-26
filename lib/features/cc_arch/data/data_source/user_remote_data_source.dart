import 'package:riverpod_kit/features/auth/data/model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(int userId);
}
