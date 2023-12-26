class IcomingMessageModel {
  final int? id;
  final int? fromUser;
  final int? toUser;
  final String? message;
  final String? createdAt;
  final String? updatedAt;
  final FromUserDetails? fromUserDetails;
  final ToUserDetails? toUserDetails;

  IcomingMessageModel({
    this.id,
    this.fromUser,
    this.toUser,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.fromUserDetails,
    this.toUserDetails,
  });

  IcomingMessageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        fromUser = json['from_user'] as int?,
        toUser = json['to_user'] as int?,
        message = json['message'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        fromUserDetails = (json['from_user_details'] as Map<String,dynamic>?) != null ? FromUserDetails.fromJson(json['from_user_details'] as Map<String,dynamic>) : null,
        toUserDetails = (json['to_user_details'] as Map<String,dynamic>?) != null ? ToUserDetails.fromJson(json['to_user_details'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'from_user' : fromUser,
    'to_user' : toUser,
    'message' : message,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'from_user_details' : fromUserDetails?.toJson(),
    'to_user_details' : toUserDetails?.toJson()
  };
}

class FromUserDetails {
  final int? id;
  final dynamic name;
  final dynamic phone;
  final dynamic gender;
  final dynamic email;
  final String? role;
  final String? imageUrl;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAt;
  final String? updatedAt;

  FromUserDetails({
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

  FromUserDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'],
        phone = json['phone'],
        gender = json['gender'],
        email = json['email'],
        role = json['role'] as String?,
        imageUrl = json['image_url'] as String?,
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

class ToUserDetails {
  final int? id;
  final String? name;
  final String? phone;
  final String? gender;
  final String? email;
  final String? role;
  final dynamic imageUrl;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final String? createdAt;
  final String? updatedAt;

  ToUserDetails({
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

  ToUserDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        phone = json['phone'] as String?,
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