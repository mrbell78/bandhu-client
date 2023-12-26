class CustommerLogin {
  final Data? data;
  final String? token;

  CustommerLogin({
    this.data,
    this.token,
  });

  CustommerLogin.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'data' : data?.toJson(),
    'token' : token
  };
}

class Data {
  final int? id;
  final String? name;
  final String? phone;
  final dynamic gender;
  final String? email;
  final dynamic password;
  final String? role;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.name,
    this.phone,
    this.gender,
    this.email,
    this.password,
    this.role,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
        gender = json['gender'],
        email = json['email'] as String?,
        password = json['password'],
        role = json['role'] as String?,
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
    'password' : password,
    'role' : role,
    'is_active' : isActive,
    'created_by' : createdBy,
    'updated_by' : updatedBy,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}