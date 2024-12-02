import 'dart:convert';
import 'package:doctorappointment_v3/data/data_models/medical_center_data_model.dart';
import 'package:flutter/services.dart';

class MedicalCenterLocalDataSource {
  Future<List<MedicalCenterDataModel>> fetchMedicalCenters() async {
    final String response = await rootBundle.loadString('assets/medical_centers.json');
    final List<dynamic> data = json.decode(response)['medical_centers'];

    return data.map((json) => MedicalCenterDataModel.fromJson(json)).toList();
  }
}
