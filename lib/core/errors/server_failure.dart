import 'package:riverpod_kit/core/errors/failure.dart';

class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({this.message});
  @override
  List<Object?> get props => [message];
}
