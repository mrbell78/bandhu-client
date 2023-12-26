class UserLoginModel {
  final String? message;
  final Data? data;

  UserLoginModel({
    this.message,
    this.data,
  });

  UserLoginModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final String? token;
  final User? user;

  Data({
    this.token,
    this.user,
  });

  Data.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String?,
        user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'token' : token,
    'user' : user?.toJson()
  };
}

class User {
  final int? id;
  final String? name;
  final dynamic phone;
  final String? gender;
  final String? email;
  final String? role;
  final dynamic imageUrl;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.name,
    this.phone,
    this.gender,
    this.email,
    this.role,
    this.imageUrl,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'],
        gender = json['gender'] as String?,
        email = json['email'] as String?,
        role = json['role'] as String?,
        imageUrl = json['image_url'],
        isActive = json['is_active'] as int?,
        createdBy = json['created_by'],
        updatedBy = json['updated_by'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'phone' : phone,
    'gender' : gender,
    'email' : email,
    'role' : role,
    'image_url' : imageUrl,
    'is_active' : isActive,
    'created_by' : createdBy,
    'updated_by' : updatedBy,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}