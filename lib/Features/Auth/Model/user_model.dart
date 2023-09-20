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

    if (json['user_type'] == "admin" ||
        json['user_type'] == 'UserTypes.admin') {
      userType = UserTypes.admin;
    } else if (json['user_type'] == "manager" ||
        json['user_type'] == 'UserTypes.manager') {
      userType = UserTypes.manager;
    } else if (json['user_type'] == "user" ||
        json['user_type'] == 'UserTypes.user') {
      userType = UserTypes.user;
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
