// Data Layer - Medical Center Data Model
import '../../domain/domain_models/medical_center.dart';

class MedicalCenterDataModel {
  final String image;
  final String title;
  final String locationName;
  final double reviewRate;
  final int countReviews;
  final double distanceKm;
  final int distanceMinutes;

  MedicalCenterDataModel({
    required this.image,
    required this.title,
    required this.locationName,
    required this.reviewRate,
    required this.countReviews,
    required this.distanceKm,
    required this.distanceMinutes,
  });

  // Convert JSON to Data Model
  factory MedicalCenterDataModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterDataModel(
      image: json['image'],
      title: json['title'],
      locationName: json['location_name'],
      reviewRate: json['review_rate'],
      countReviews: json['count_reviews'],
      distanceKm: json['distance_km'],
      distanceMinutes: json['distance_minutes'],
    );
  }

  // Convert Data Model to Domain Model
  MedicalCenter toDomainModel() {
    return MedicalCenter(
      image: image,
      title: title,
      locationName: locationName,
      reviewRate: reviewRate,
      countReviews: countReviews,
      distanceKm: distanceKm,
      distanceMinutes: distanceMinutes,
    );
  }
}