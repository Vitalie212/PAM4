// Data Layer - Banner Data Model
import '../../domain/domain_models/banner.dart';

class BannerDataModel {
  final String title;
  final String description;
  final String image;

  BannerDataModel({
    required this.title,
    required this.description,
    required this.image,
  });

  // Convert JSON to Data Model
  factory BannerDataModel.fromJson(Map<String, dynamic> json) {
    return BannerDataModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }

  // Convert Data Model to Domain Model
  Banner toDomainModel() {
    return Banner(
      title: title,
      description: description,
      image: image,
    );
  }
}