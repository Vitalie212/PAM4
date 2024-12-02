import 'package:doctorappointment_v3/data/data_models/banner_data_model.dart';

abstract class BannerRepository {
  Future<List<BannerDataModel>> getBanners();
}
