class UserProfile {
  final String name;
  final String email;
  final int age;

  UserProfile({required this.name, required this.email, required this.age});

  UserProfile copyWith({String? name, String? email, int? age}) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }
}
