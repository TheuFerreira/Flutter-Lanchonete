abstract class ProductService {
  Future<List<dynamic>> getAll(Object parameters);
  Future<List<dynamic>> getAllByCategories(Object parameters);
  Future<dynamic> getById(int productId);
}
