import 'package:lanchonete_app/infra/models/product_grid_model.dart';

abstract class FavoriteService {
  Future<bool> update(int productId);
  Future<List<ProductGridModel>> search(Object parameters);
  Future<int> count();
}
