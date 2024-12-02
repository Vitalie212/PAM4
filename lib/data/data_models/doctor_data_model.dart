// Data Layer - Doctor Data Model
import '../../domain/domain_models/doctor.dart';

class DoctorDataModel {
  final String image;
  final String fullName;
  final String typeOfDoctor;
  final String locationOfCenter;
  final double reviewRate;
  final int reviewsCount;

  DoctorDataModel({
    required this.image,
    required this.fullName,
    required this.typeOfDoctor,
    required this.locationOfCenter,
    required this.reviewRate,
    required this.reviewsCount,
  });

  // Convert JSON to Data Model
  factory DoctorDataModel.fromJson(Map<String, dynamic> json) {
    return DoctorDataModel(
      image: json['image'],
      fullName: json['full_name'],
      typeOfDoctor: json['type_of_doctor'],
      locationOfCenter: json['location_of_center'],
      reviewRate: json['review_rate'],
      reviewsCount: json['reviews_count'],
    );
  }

  // Convert Data Model to Domain Model
  Doctor toDomainModel() {
    return Doctor(
      image: image,
      fullName: fullName,
      typeOfDoctor: typeOfDoctor,
      locationOfCenter: locationOfCenter,
      reviewRate: reviewRate,
      reviewsCount: reviewsCount,
    );
  }
}