import 'dart:convert';
import 'package:doctorappointment_v3/data/data_models/category_data_model.dart';
import 'package:flutter/services.dart';

class CategoryLocalDataSource {
  Future<List<CategoryDataModel>> fetchCategories() async {
    final String response = await rootBundle.loadString('assets/categories.json');
    final List<dynamic> data = json.decode(response)['categories'];

    return data.map((json) => CategoryDataModel.fromJson(json)).toList();
  }
}
