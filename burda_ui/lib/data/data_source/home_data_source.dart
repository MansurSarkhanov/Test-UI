import 'package:burda_ui/models/product_model.dart';
import 'package:dio/dio.dart';

final class HomeDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/'));

  Future<List<ProductModel>?> fetchProductAll() async {
    final response = await dio.get('products');
    if (response.statusCode == 200) {
      final products = response.data;
      if (products is List) {
        final list = products.map((e) => ProductModel.fromJson(e)).toList();
        return list;
      }
    }
    return null;
  }

  Future<List<String>?> getAllCategory() async {
    final response = await dio.get('products/categories');
    if (response.statusCode == 200) {
      final category = response.data;
      if (category is List) {
        final list = category.map((e) => e.toString()).toList();
        return list;
      }
    }
    return null;
  }
}
