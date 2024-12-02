import 'dart:convert';
import 'package:doctorappointment_v3/data/data_models/banner_data_model.dart';
import 'package:flutter/services.dart';

class BannerLocalDataSource {
  Future<List<BannerDataModel>> fetchBanners() async {
    final String response = await rootBundle.loadString('assets/banners.json');
    final List<dynamic> data = json.decode(response)['banners'];

    return data.map((json) => BannerDataModel.fromJson(json)).toList();
  }
}
