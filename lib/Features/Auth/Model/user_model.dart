class UserModel {
  String? username;
  String? email;
  UserTypes? userType;
  String? token;

  UserModel(
      {required this.token,
      required this.username,
      required this.email,
      required this.userType});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
    email = json['email'];

    if (json['user_type'] == "admin") {
      userType = UserTypes.manager;
    } else if (json['user_type'] == "manager") {
      userType = UserTypes.user;
    } else if (json['user_type'] == "user") {
      userType = UserTypes.manager;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    data['email'] = email;
    data['user_type'] = userType.toString();
    return data;
  }
}

enum UserTypes { admin, manager, user }
