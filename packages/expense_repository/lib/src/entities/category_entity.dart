class CategoryEntity {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  int color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  //! DỰA VÀO ĐẶC TRUNG DỮ LIỆU LÀ MAP CỦA FIREBASE
  //! TẠO RA CÁI NÀY

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'totalExpenses': totalExpenses,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> doc) {
    return CategoryEntity(
      categoryId: doc['categoryId'],
      name: doc['name'],
      totalExpenses: doc['totalExpenses'],
      icon: doc['icon'],
      color: doc['color'],
    );
  }
}
