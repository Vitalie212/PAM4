import 'package:doctorappointment_v3/data/data_models/doctor_data_model.dart';

abstract class DoctorRepository {
  Future<List<DoctorDataModel>> getDoctors();
}