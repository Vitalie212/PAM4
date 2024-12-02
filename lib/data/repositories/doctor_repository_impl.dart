import 'package:doctorappointment_v3/data/data_models/doctor_data_model.dart';

import '../../domain/domain_repositories/doctor_repository.dart';
import '../data_sources/doctor_local_datasource.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorLocalDataSource localDataSource;

  DoctorRepositoryImpl({required this.localDataSource});

  @override
  Future<List<DoctorDataModel>> getDoctors() async {
    return await localDataSource.fetchDoctors();
  }
}
