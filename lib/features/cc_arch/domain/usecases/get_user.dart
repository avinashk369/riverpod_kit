import 'package:dartz/dartz.dart';
import 'package:riverpod_kit/core/errors/failure.dart';
import 'package:riverpod_kit/core/use_case/use_case.dart';
import 'package:riverpod_kit/features/cc_arch/domain/entities/user_entity.dart';
import 'package:riverpod_kit/features/cc_arch/domain/repositories/user_repository.dart';
import 'package:riverpod_kit/features/cc_arch/domain/usecases/get_user_params.dart';

class GetUser implements UseCase<UserEntity, GetUserParams> {
  final UserRepository repository;
  GetUser({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await repository.getUser(params.userId);
  }

  Future<Either<Failure, UserEntity>> called(GetUserParams params) async {
    return await repository.getUser(params.userId);
  }
}
