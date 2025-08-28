import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  // final Logger _logger = Logger(
  //   printer: PrettyPrinter(
  //     methodCount: 0,
  //     errorMethodCount: 5,
  //     lineLength: 50,
  //     colors: true,
  //     printEmojis: true,
  //     printTime: true,
  //   ),
  // );

  DioClient() : dio = Dio() {
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    dio.options.headers['User-Agent'] =
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3';
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // _logger.d('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // _logger.d(
          //   'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          // );
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // _logger.e(
          //   'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
          // );
          return handler.next(e);
        },
      ),
    );
  }
}
