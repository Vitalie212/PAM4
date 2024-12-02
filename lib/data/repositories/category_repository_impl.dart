import 'package:doctorappointment_v3/data/data_models/category_data_model.dart';

import '../../domain/domain_repositories/category_repository.dart';
import '../data_sources/category_local_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CategoryDataModel>> getCategories() async {
    return await localDataSource.fetchCategories();
  }
}
