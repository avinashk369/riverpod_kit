import 'package:dio/dio.dart';
import 'package:riverpod_kit/core/exceptions/network_exception.dart';
import 'package:riverpod_kit/core/exceptions/server_exception.dart';
import 'package:riverpod_kit/features/cc_arch/data/data_source/user_remote_data_source.dart';
import 'package:riverpod_kit/features/cc_arch/data/models/user_model.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;
  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUser(int userId) async {
    final url = 'https://fake-json-api.mock.beeceptor.com/users';
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data[0] as Map<String, dynamic>);
      } else {
        throw ServerException(message: 'Failed to load user.');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException();
      }
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
