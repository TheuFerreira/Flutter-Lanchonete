import 'dart:convert';

import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';

abstract class GetAllProductsCase {
  Future<List<ProductGridResponse>> call({
    List<int>? categories,
    String search = '',
  });
}

class GetAllProductsCaseImpl implements GetAllProductsCase {
  final NumberService _numberService;
  final ProductService _productService;

  const GetAllProductsCaseImpl(
    this._numberService,
    this._productService,
  );

  @override
  Future<List<ProductGridResponse>> call({
    List<int>? categories,
    String search = '',
  }) async {
    Map<String, dynamic> parameters = {
      'categories': categories ?? [],
      'search': search,
    };

    final models = await _productService.getAllByCategories(parameters);
    final products = models.map((e) {
      final price = e.price;
      final priceStr = _numberService.numToMoney(price);

      final photo = base64Decode(e.image);
      return ProductGridResponse(
        productId: e.productId,
        title: e.title,
        price: priceStr,
        rating: e.rating,
        photo: photo,
      );
    }).toList();

    return products;
  }
}
