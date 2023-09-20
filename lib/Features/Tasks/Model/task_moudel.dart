class TaskModel {
  int? id;
  String? name;
  String? description;
  String? photo;
  String? status;
  String? startDate;
  String? endDate;
  Creator? creator;
  Department? department;
  Creator? employee;

  TaskModel(
      {this.id,
      this.name,
      this.description,
      this.photo,
      this.status,
      this.startDate,
      this.endDate,
      this.creator,
      this.department,
      this.employee});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    status = json['status'];
    startDate = json['start date'];
    endDate = json['end date'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    employee =
        json['employee'] != null ? Creator.fromJson(json['employee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['photo'] = photo;
    data['status'] = status;
    data['start date'] = startDate;
    data['end date'] = endDate;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    return data;
  }
}

class Creator {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  Creator(
      {this.id,
      this.userCode,
      this.name,
      this.email,
      this.phone,
      this.status,
      this.userType});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_code'] = userCode;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['user_type'] = userType;
    return data;
  }
}

class Department {
  int? id;
  String? name;
  Creator? manager;

  Department({this.id, this.name, this.manager});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    manager =
        json['manager'] != null ? Creator.fromJson(json['manager']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (manager != null) {
      data['manager'] = manager!.toJson();
    }
    return data;
  }
}
