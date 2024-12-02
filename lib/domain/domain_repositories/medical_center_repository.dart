import 'package:doctorappointment_v3/data/data_models/medical_center_data_model.dart';

abstract class MedicalCenterRepository {
  Future<List<MedicalCenterDataModel>> getMedicalCenters();
}