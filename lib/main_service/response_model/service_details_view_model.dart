class ServiceDetailsViewModel {
  final List<Data>? data;

  ServiceDetailsViewModel({
    this.data,
  });

  ServiceDetailsViewModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final int? servicelistId;
  final String? title;
  final String? description;
  final String? colorCode;
  final dynamic mediaUrl;
  final int? isActive;
  final int? createdBy;
  final dynamic updatedBy;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.servicelistId,
    this.title,
    this.description,
    this.colorCode,
    this.mediaUrl,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        servicelistId = json['servicelist_id'] as int?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        colorCode = json['color_code'] as String?,
        mediaUrl = json['media_url'],
        isActive = json['is_active'] as int?,
        createdBy = json['created_by'] as int?,
        updatedBy = json['updated_by'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'servicelist_id' : servicelistId,
    'title' : title,
    'description' : description,
    'color_code' : colorCode,
    'media_url' : mediaUrl,
    'is_active' : isActive,
    'created_by' : createdBy,
    'updated_by' : updatedBy,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}