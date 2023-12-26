class MessageByInboxModel {
  final int? currentPage;
  final List<Data>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  MessageByInboxModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  MessageByInboxModel.fromJson(Map<String, dynamic> json)
      : currentPage = json['current_page'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        firstPageUrl = json['first_page_url'] as String?,
        from = json['from'] as int?,
        lastPage = json['last_page'] as int?,
        lastPageUrl = json['last_page_url'] as String?,
        links = (json['links'] as List?)?.map((dynamic e) => Links.fromJson(e as Map<String,dynamic>)).toList(),
        nextPageUrl = json['next_page_url'],
        path = json['path'] as String?,
        perPage = json['per_page'] as int?,
        prevPageUrl = json['prev_page_url'],
        to = json['to'] as int?,
        total = json['total'] as int?;

  Map<String, dynamic> toJson() => {
    'current_page' : currentPage,
    'data' : data?.map((e) => e.toJson()).toList(),
    'first_page_url' : firstPageUrl,
    'from' : from,
    'last_page' : lastPage,
    'last_page_url' : lastPageUrl,
    'links' : links?.map((e) => e.toJson()).toList(),
    'next_page_url' : nextPageUrl,
    'path' : path,
    'per_page' : perPage,
    'prev_page_url' : prevPageUrl,
    'to' : to,
    'total' : total
  };
}

class Data {
  final int? id;
  final int? inboxId;
  final int? userId;
  final String? message;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.inboxId,
    this.userId,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        inboxId = json['inbox_id'] as int?,
        userId = json['user_id'] as int?,
        message = json['message'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'inbox_id' : inboxId,
    'user_id' : userId,
    'message' : message,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}

class Links {
  final dynamic url;
  final String? label;
  final bool? active;

  Links({
    this.url,
    this.label,
    this.active,
  });

  Links.fromJson(Map<String, dynamic> json)
      : url = json['url'],
        label = json['label'] as String?,
        active = json['active'] as bool?;

  Map<String, dynamic> toJson() => {
    'url' : url,
    'label' : label,
    'active' : active
  };
}