import 'package:riverpod_kit/features/cc_arch/data/data_source/dio_client.dart';
import 'package:riverpod_kit/features/cc_arch/data/data_source/user_remote_data_source.dart';
import 'package:riverpod_kit/features/cc_arch/data/data_source/user_remote_data_source_impl.dart';
import 'package:riverpod_kit/features/cc_arch/data/repositories/user_repositories_impl.dart';
import 'package:riverpod_kit/features/cc_arch/domain/repositories/user_repository.dart';
import 'package:riverpod_kit/features/cc_arch/domain/usecases/get_user.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupLocator() {
  // Register DioClient as a singleton, which holds a single instance of Dio
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Register remote data source, injecting the Dio instance from the DioClient
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: getIt<DioClient>().dio),
  );

  // Register the repository implementation, injecting the data source
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt()),
  );

  // Register the Use Case, injecting the repository
  getIt.registerLazySingleton<GetUser>(() => GetUser(repository: getIt()));
}
