class CategoryAndSubCategoryModel {
  final String status;
  final int totalSubcategories;
  final List<Category> data;

  CategoryAndSubCategoryModel({
    required this.status,
    required this.totalSubcategories,
    required this.data,
  });

  factory CategoryAndSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryAndSubCategoryModel(
      status: json['status'],
      totalSubcategories: json['total_subcategories'],
      data: List<Category>.from(
        (json['data'] as List).map((x) => Category.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'total_subcategories': totalSubcategories,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Category {
  final int id;
  final int coachingArea;
  final String coachingAreaName;
  final String name;
  final String? image;
  final String description;
  final DateTime createdOn;
  final DateTime updatedOn;

  Category({
    required this.id,
    required this.coachingArea,
    required this.coachingAreaName,
    required this.name,
    this.image,
    required this.description,
    required this.createdOn,
    required this.updatedOn,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      coachingArea: json['coaching_area'],
      coachingAreaName: json['coaching_area_name'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: DateTime.parse(json['updated_on']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'coaching_area': coachingArea,
    'coaching_area_name': coachingAreaName,
    'name': name,
    'image': image,
    'description': description,
    'created_on': createdOn.toIso8601String(),
    'updated_on': updatedOn.toIso8601String(),
  };
}
