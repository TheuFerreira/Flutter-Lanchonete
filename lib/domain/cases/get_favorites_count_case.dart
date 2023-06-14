import 'package:lanchonete_app/domain/services/product_service.dart';

abstract class GetFavoritesCountCase {
  Future<String?> call();
}

class GetFavoritesCountCaseImpl implements GetFavoritesCountCase {
  final ProductService _productService;

  const GetFavoritesCountCaseImpl(this._productService);

  @override
  Future<String?> call() async {
    final count = await _productService.countFavorites();
    if (count == 0) {
      return null;
    }

    return count.toString();
  }
}
