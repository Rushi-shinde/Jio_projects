class User {
  int? id;
  String username;
  String email;
  String mobile;
  String gender;
  String password;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      mobile: map['mobile'],
      gender: map['gender'],
      password: map['password'],
    );
  }
}
