import 'package:lanchonete_app/infra/models/product_grid_model.dart';
import 'package:lanchonete_app/infra/models/product_info_model.dart';

abstract class ProductService {
  Future<List<ProductGridModel>> getAllByCategories(Object parameters);
  Future<ProductInfoModel> getById(int productId);
}
