import 'package:flutter_clean/domain/entities/category.dart';
import 'package:flutter_clean/domain/repostories/card_repository.dart';

class DataCategoryModel extends CategoryRepository {
  List<Category> category = [];

  static final DataCategoryModel _instance = DataCategoryModel._internal();
  DataCategoryModel._internal() {
    category = <Category>[];
    category.addAll([
      Category(
        categoryName: 'Technology',
        imageUrl:
            'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
      ),
      Category(
        categoryName: 'Sports',
        imageUrl:
            'https://media.socastsrm.com/wordpress/wp-content/blogs.dir/1479/files/2019/02/20170626151914_sports-equipment.jpg',
      ),
      Category(
        categoryName: 'Business',
        imageUrl:
            'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80',
      ),
      Category(
        categoryName: 'Entertainment',
        imageUrl:
            'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80',
      ),
      Category(
        categoryName: 'Health',
        imageUrl:
            'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80',
      ),
      Category(
        categoryName: 'Science',
        imageUrl:
            'https://media.socastsrm.com/wordpress/wp-content/blogs.dir/1479/files/2019/02/20170626151914_sports-equipment.jpg',
      ),
    ]);
  }
  factory DataCategoryModel() => _instance;

  @override
  Future<List<Category>> getCategory() async {
    return category;
  }
}
