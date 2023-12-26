class CreateInbox {
  final String? message;
  final Data? data;

  CreateInbox({
    this.message,
    this.data,
  });

  CreateInbox.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.toJson()
  };
}

class Data {
  final int? id;
  final int? userId;
  final int? receiverId;
  final dynamic lastMessage;
  final dynamic lastSendUserId;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.userId,
    this.receiverId,
    this.lastMessage,
    this.lastSendUserId,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        receiverId = json['receiver_id'] as int?,
        lastMessage = json['last_message'],
        lastSendUserId = json['last_send_user_id'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'receiver_id' : receiverId,
    'last_message' : lastMessage,
    'last_send_user_id' : lastSendUserId,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}