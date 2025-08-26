import 'package:riverpod_kit/features/cc_arch/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(int userId);
}
