import 'package:lanchonete_app/domain/services/favorite_service.dart';

abstract class GetFavoritesCountCase {
  Future<String?> call();
}

class GetFavoritesCountCaseImpl implements GetFavoritesCountCase {
  final FavoriteService _favoriteService;

  const GetFavoritesCountCaseImpl(this._favoriteService);

  @override
  Future<String?> call() async {
    final count = await _favoriteService.count();
    if (count == 0) {
      return null;
    }

    return count.toString();
  }
}
