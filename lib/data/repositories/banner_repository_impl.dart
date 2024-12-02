import 'package:doctorappointment_v3/data/data_models/banner_data_model.dart';

import '../../domain/domain_repositories/banner_repository.dart';
import '../data_sources/banner_local_datasource.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerLocalDataSource localDataSource;

  BannerRepositoryImpl({required this.localDataSource});

  @override
  Future<List<BannerDataModel>> getBanners() async {
    return await localDataSource.fetchBanners();
  }
}
