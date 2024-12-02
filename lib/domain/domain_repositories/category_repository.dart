import 'package:doctorappointment_v3/data/data_models/category_data_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryDataModel>> getCategories();
}