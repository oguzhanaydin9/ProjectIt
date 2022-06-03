class UserModel {
  final String userMail, password;
  final int id;

  UserModel({required this.userMail, required this.password, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userMail: json['UserMail'],
        password: json['UserPassword'],
        id: json['Id']);
  }
}
