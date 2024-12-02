import 'package:doctorappointment_v3/data/data_models/medical_center_data_model.dart';

import '../../domain/domain_repositories/medical_center_repository.dart';
import '../data_sources/medical_center_local_datasource.dart';

class MedicalCenterRepositoryImpl implements MedicalCenterRepository {
  final MedicalCenterLocalDataSource localDataSource;

  MedicalCenterRepositoryImpl({required this.localDataSource});

  @override
  Future<List<MedicalCenterDataModel>> getMedicalCenters() async {
    return await localDataSource.fetchMedicalCenters();
  }
}
