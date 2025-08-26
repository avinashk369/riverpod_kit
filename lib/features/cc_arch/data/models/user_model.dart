class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String name,
    required String username,
  }) : super(id: id, name: name, username: username);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
    );
  }
}
