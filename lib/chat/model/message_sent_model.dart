class MessageSendResponseModel {
  final int? fromUser;
  final String? toUser;
  final String? message;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  MessageSendResponseModel({
    this.fromUser,
    this.toUser,
    this.message,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  MessageSendResponseModel.fromJson(Map<String, dynamic> json)
      : fromUser = json['from_user'] as int?,
        toUser = json['to_user'] as String?,
        message = json['message'] as String?,
        updatedAt = json['updated_at'] as String?,
        createdAt = json['created_at'] as String?,
        id = json['id'] as int?;

  Map<String, dynamic> toJson() => {
    'from_user' : fromUser,
    'to_user' : toUser,
    'message' : message,
    'updated_at' : updatedAt,
    'created_at' : createdAt,
    'id' : id
  };
}