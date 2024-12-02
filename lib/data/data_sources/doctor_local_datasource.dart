import 'dart:convert';
import 'package:doctorappointment_v3/data/data_models/doctor_data_model.dart';
import 'package:flutter/services.dart';

class DoctorLocalDataSource {
  Future<List<DoctorDataModel>> fetchDoctors() async {
    final String response = await rootBundle.loadString('assets/doctors.json');
    final List<dynamic> data = json.decode(response)['doctors'];

    return data.map((json) => DoctorDataModel.fromJson(json)).toList();
  }
}
