import 'dart:convert';

import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';
import 'package:lanchonete_app/infra/models/label_info_model.dart';
import 'package:lanchonete_app/infra/models/product_info_model.dart';

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
  Future<ProductInfoModel> getById(int productId) async {
    final map = await fetch.get(route: '/Product/ById/$productId');
    final data = ProductInfoModel.fromMap(map);
    data.labels = (map['labels'] as List<dynamic>)
        .map((e) => LabelInfoModel.fromMap(e))
        .toList();
    data.images = map['images'].cast<String>();
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
