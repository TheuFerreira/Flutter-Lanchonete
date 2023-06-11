import 'package:lanchonete_app/domain/services/product_service.dart';

abstract class UpdateFavoriteOfProductCase {
  Future<bool> call(int productId);
}

class UpdateFavoriteOfProductCaseImpl implements UpdateFavoriteOfProductCase {
  final ProductService _productService;

  const UpdateFavoriteOfProductCaseImpl(this._productService);

  @override
  Future<bool> call(int productId) async {
    final newValue = await _productService.updateFavorite(productId);
    return newValue;
  }
}
