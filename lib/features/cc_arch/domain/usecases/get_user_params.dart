class GetUserParams extends Equatable {
  final int userId;
  const GetUserParams({required this.userId});
  @override
  List<Object?> get props => [userId];
}
