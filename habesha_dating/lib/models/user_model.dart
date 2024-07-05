import 'dart:convert';

DatingUser datingUserFromJson(String str) =>
    DatingUser.fromJson(json.decode(str));

String datingUserToJson(DatingUser data) => json.encode(data.toJson);

class DatingUser {
  String? userId;
  String? msg;
  String? token;
  String? userEmail;

  DatingUser({
    required this.msg,
    required this.userId,
    required this.token,
    required this.userEmail,
  });

  factory DatingUser.fromJson(Map<String, dynamic> json) => DatingUser(
      msg: json["msg"],
      userId: json["userId"],
      token: json["token"],
      userEmail: json["userEmail"]);

  Map<String, dynamic> toJson() =>
      {"msg": msg, "userId": userId, "token": token, "userEmail": userEmail};
}
