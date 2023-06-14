import 'package:lanchonete_app/domain/services/favorite_service.dart';

abstract class UpdateFavoriteOfProductCase {
  Future<bool> call(int productId);
}

class UpdateFavoriteOfProductCaseImpl implements UpdateFavoriteOfProductCase {
  final FavoriteService _favoriteService;

  const UpdateFavoriteOfProductCaseImpl(this._favoriteService);

  @override
  Future<bool> call(int productId) async {
    final newValue = await _favoriteService.update(productId);
    return newValue;
  }
}
