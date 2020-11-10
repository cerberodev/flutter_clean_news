import 'package:flutter_clean/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategory();
}
