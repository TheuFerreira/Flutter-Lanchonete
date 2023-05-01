import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';

class ProductServiceImpl implements ProductService {
  final String _apiUrl;

  const ProductServiceImpl(this._apiUrl);

  @override
  Future<List<dynamic>> getAll() async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Product/All');
    final data = response.data;
    return data;
  }

  @override
  Future<dynamic> getById(int productId) async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Product/ById/$productId');
    final data = response.data;
    return data;
  }

  @override
  Future<List> getAllByCategories(List<int> categories) async {
    final json = jsonEncode(categories);

    final dio = Dio();
    final response = await dio.post(
      '$_apiUrl/Product/AllByCategories',
      data: json,
    );
    final data = response.data;
    return data;
  }
}
