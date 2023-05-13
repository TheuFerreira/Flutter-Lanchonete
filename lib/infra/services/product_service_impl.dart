import 'dart:convert';

import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';

class ProductServiceImpl implements ProductService {
  final Fetch fetch;

  const ProductServiceImpl({
    required this.fetch,
  });

  @override
  Future<List<dynamic>> getAll(Object parameters) async {
    final json = jsonEncode(parameters);

    final data = await fetch.post(
      route: '/Product/All',
      params: json,
    );
    return data;
  }

  @override
  Future<dynamic> getById(int productId) async {
    final data = await fetch.get(route: '/Product/ById/$productId');
    return data;
  }

  @override
  Future<List> getAllByCategories(Object parameters) async {
    final json = jsonEncode(parameters);

    final data = await fetch.post(
      route: '/Product/AllByCategories',
      params: json,
    );
    return data;
  }
}
