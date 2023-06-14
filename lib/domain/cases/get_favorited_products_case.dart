import 'dart:convert';

import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/domain/services/favorite_service.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';

abstract class GetFavoritedProductsCase {
  Future<List<ProductGridResponse>> call({String search = ''});
}

class GetFavoritedProductsCaseImpl implements GetFavoritedProductsCase {
  final FavoriteService _favoriteService;
  final NumberService _numberService;

  const GetFavoritedProductsCaseImpl(
    this._favoriteService,
    this._numberService,
  );

  @override
  Future<List<ProductGridResponse>> call({String search = ''}) async {
    Map<String, dynamic> parameters = {'search': search};

    final models = await _favoriteService.search(parameters);
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
        favorite: e.favorite,
      );
    }).toList();

    return products;
  }
}
