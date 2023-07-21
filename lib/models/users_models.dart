class User {
  String name;
  String userName;
  String email;
  String password;
  String phoneNumber;
  String male;
  String id;
  User({
    required this.name,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.male,
    required this.id,
  });

  factory User.fromJson(Map<String, Object?> json) => User(
        name: json['name'] as String,
        userName: json['userName'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phoneNumber: json['phoneNumber'] as String,
        male: json['male'] as String,
        id: json['id'] as String,
      );
}
