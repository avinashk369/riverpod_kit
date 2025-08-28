import 'package:dio/dio.dart';
import 'package:riverpod_kit/core/di/di.dart';
import 'package:riverpod_kit/features/cc_arch/data/data_source/user_remote_data_source_impl.dart';
import 'package:riverpod_kit/features/cc_arch/data/repositories/user_repositories_impl.dart';
import 'package:riverpod_kit/features/cc_arch/domain/entities/user_entity.dart';
import 'package:riverpod_kit/features/cc_arch/domain/usecases/get_user.dart';
import 'package:riverpod_kit/features/cc_arch/domain/usecases/get_user_params.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_kit/main.dart';
part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<UserEntity> build(int userId) async {
    // final dio = Dio()
    //   ..options.baseUrl = 'https://jsonplaceholder.typicode.com'
    //   ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // final remoteDataSource = UserRemoteDataSourceImpl(dio: dio);
    // final repository = UserRepositoryImpl(remoteDataSource: remoteDataSource);
    // final getUserUseCase = GetUser(repository: repository);

    // final result = await getUserUseCase.called(GetUserParams(userId: userId));
    // return result.fold((failure) => Future.error(failure), (user) => user);
    // Get the Use Case from the service locator instead of creating it here
    final getUserUseCase = getIt<GetUser>();

    final result = await getUserUseCase(GetUserParams(userId: userId));
    return result.fold((failure) => Future.error(failure), (user) => user);
  }
}
