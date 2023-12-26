class SendMessageModel {
  final String? message;
  final Data? data;

  SendMessageModel({
    this.message,
    this.data,
  });

  SendMessageModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? userId;
  final String? message;
  final int? inboxId;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.userId,
    this.message,
    this.inboxId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'] as int?,
        message = json['message'] as String?,
        inboxId = json['inbox_id'] as int?,
        updatedAt = json['updated_at'] as String?,
        createdAt = json['created_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'user_id' : userId,
    'message' : message,
    'inbox_id' : inboxId,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}