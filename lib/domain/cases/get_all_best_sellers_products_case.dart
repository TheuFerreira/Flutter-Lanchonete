import 'dart:convert';

import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';

abstract class GetAllBestSellersProductsCase {
  Future<List<ProductGridResponse>> call({
    List<int>? categories,
    String search = '',
  });
}

class GetAllBestSellersProductsCaseImpl
    implements GetAllBestSellersProductsCase {
  final ProductService _productService;
  final NumberService _numberService;

  const GetAllBestSellersProductsCaseImpl(
    this._productService,
    this._numberService,
  );

  @override
  Future<List<ProductGridResponse>> call({
    List<int>? categories,
    String search = '',
  }) async {
    Map<String, dynamic> parameters = {
      'categories': categories ?? [],
      'search': search,
      'limit': 4,
    };

    final models =
        await _productService.getAllBestSellersByCategories(parameters);
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
