import 'package:lanchonete_app/infra/models/product_info_model.dart';

abstract class ProductService {
  Future<List<dynamic>> getAllByCategories(Object parameters);
  Future<ProductInfoModel> getById(int productId);
}
