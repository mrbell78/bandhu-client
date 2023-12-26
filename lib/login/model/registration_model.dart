class RegistrationModel {
  final Data? data;
  final String? token;

  RegistrationModel({
    this.data,
    this.token,
  });

  RegistrationModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        token = json['token'] as String?;

  Map<String, dynamic> toJson() => {
    'data' : data?.toJson(),
    'token' : token
  };
}

class Data {
  final String? name;
  final dynamic phone;
  final String? email;
  final String? role;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.name,
    this.phone,
    this.email,
    this.role,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        phone = json['phone'],
        email = json['email'] as String?,
        role = json['role'] as String?,
        updatedAt = json['updated_at'] as String?,
        createdAt = json['created_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'phone' : phone,
    'email' : email,
    'role' : role,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}