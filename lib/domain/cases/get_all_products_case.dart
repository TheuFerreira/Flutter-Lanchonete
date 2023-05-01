import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';

abstract class GetAllProductsCase {
  Future<List<ProductGridResponse>> call();
}

class GetAllProductsCaseImpl implements GetAllProductsCase {
  final NumberService _numberService;
  final String _apiUrl;

  const GetAllProductsCaseImpl(
    this._numberService,
    this._apiUrl,
  );

  @override
  Future<List<ProductGridResponse>> call() async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Product/All');
    final data = response.data;

    List<ProductGridResponse> products = [];
    for (final map in data) {
      final productId = map['product_id'];
      final title = map['title'];
      final rating = map['rating'];
      final image = map['image'];
      final photo = base64Decode(image);

      final price = map['price'];
      final priceStr = _numberService.numToMoney(price);

      final response = ProductGridResponse(
        productId: productId,
        title: title,
        price: priceStr,
        rating: rating,
        photo: photo,
      );
      products.add(response);
    }

    return products;
  }
}
