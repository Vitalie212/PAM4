// Data Layer - Category Data Model
import '../../domain/domain_models/category.dart';

class CategoryDataModel {
  final String title;
  final String icon;


  CategoryDataModel({
    required this.title,
    required this.icon,
  });

  // Convert JSON to Data Model
  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      title: json['title'],
      icon: json['icon']
    );
  }

  // Convert Data Model to Domain Model
  Category toDomainModel() {
    return Category(
      title: title,
      icon: icon
    );
  }
}