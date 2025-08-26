import 'package:dartz/dartz.dart';
import 'package:riverpod_kit/core/errors/failure.dart';
import 'package:riverpod_kit/core/errors/network_failure.dart';
import 'package:riverpod_kit/core/errors/server_failure.dart';
import 'package:riverpod_kit/core/exceptions/network_exception.dart';
import 'package:riverpod_kit/core/exceptions/server_exception.dart';
import 'package:riverpod_kit/features/cc_arch/data/data_source/user_remote_data_source.dart';
import 'package:riverpod_kit/features/cc_arch/domain/entities/user_entity.dart';
import 'package:riverpod_kit/features/cc_arch/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser(int userId) async {
    try {
      final userModel = await remoteDataSource.getUser(userId);
      return Right(userModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    }
  }
}
