class ServiceList {
  final List<Data>? data;

  ServiceList({
    this.data,
  });

  ServiceList.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? name;
  final String? imageUrl;
  final int? isActive;
  final int? createdBy;
  final dynamic updatedBy;
  final String? createdAt;
  final String? updatedAt;

  Data({
    this.id,
    this.name,
    this.imageUrl,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        imageUrl = json['image_url'] as String?,
        isActive = json['is_active'] as int?,
        createdBy = json['created_by'] as int?,
        updatedBy = json['updated_by'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image_url' : imageUrl,
    'is_active' : isActive,
    'created_by' : createdBy,
    'updated_by' : updatedBy,
    'created_at' : createdAt,
    'updated_at' : updatedAt
  };
}