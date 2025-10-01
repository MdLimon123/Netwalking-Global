class AllCategoryResponse {
  final String status;
  final int totalCategories;
  final List<AllCategory> data;

  AllCategoryResponse({
    required this.status,
    required this.totalCategories,
    required this.data,
  });

  factory AllCategoryResponse.fromJson(Map<String, dynamic> json) {
    return AllCategoryResponse(
      status: json['status'] ?? '',
      totalCategories: json['total_categories'] ?? 0,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AllCategory.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'total_categories': totalCategories,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class AllCategory {
  final int id;
  final String name;
  final String? image;
  final String description;
  final DateTime createdOn;
  final DateTime updatedOn;

  AllCategory({
    required this.id,
    required this.name,
    this.image,
    required this.description,
    required this.createdOn,
    required this.updatedOn,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) {
    return AllCategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'],
      description: json['description'] ?? '',
      createdOn:
      DateTime.tryParse(json['created_on'] ?? '') ?? DateTime.now(),
      updatedOn:
      DateTime.tryParse(json['updated_on'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'created_on': createdOn.toIso8601String(),
      'updated_on': updatedOn.toIso8601String(),
    };
  }
}
