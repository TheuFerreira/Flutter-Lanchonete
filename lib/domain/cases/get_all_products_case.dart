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

    List<dynamic> data = await _productService.getAllByCategories(parameters);

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
