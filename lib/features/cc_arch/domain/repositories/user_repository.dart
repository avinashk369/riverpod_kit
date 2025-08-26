import 'package:riverpod_kit/core/errors/failure.dart';
import 'package:riverpod_kit/features/cc_arch/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser(int userId);
}
