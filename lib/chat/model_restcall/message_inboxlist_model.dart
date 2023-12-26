class MessageInboxListModel {
  final String? message;
  final List<Data>? data;

  MessageInboxListModel({
    this.message,
    this.data,
  });

  MessageInboxListModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final int? userId;
  final int? receiverId;
  final String? lastMessage;
  final int? lastSendUserId;
  final String? createdAt;
  final String? updatedAt;
  final Receiver? receiver;

  Data({
    this.id,
    this.userId,
    this.receiverId,
    this.lastMessage,
    this.lastSendUserId,
    this.createdAt,
    this.updatedAt,
    this.receiver,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        receiverId = json['receiver_id'] as int?,
        lastMessage = json['last_message'] as String?,
        lastSendUserId = json['last_send_user_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        receiver = (json['receiver'] as Map<String,dynamic>?) != null ? Receiver.fromJson(json['receiver'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'receiver_id' : receiverId,
    'last_message' : lastMessage,
    'last_send_user_id' : lastSendUserId,
    'created_at' : createdAt,
    'updated_at' : updatedAt,
    'receiver' : receiver?.toJson()
  };
}

class Receiver {
  final int? id;
  final String? email;
  final String? role;
  final dynamic imageUrl;
  final dynamic gender;

  Receiver({
    this.id,
    this.email,
    this.role,
    this.imageUrl,
    this.gender,
  });

  Receiver.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        email = json['email'] as String?,
        role = json['role'] as String?,
        imageUrl = json['image_url'],
        gender = json['gender'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'email' : email,
    'role' : role,
    'image_url' : imageUrl,
    'gender' : gender
  };
}