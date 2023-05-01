abstract class ProductService {
  Future<List<dynamic>> getAll();
  Future<List<dynamic>> getAllByCategories(List<int> categories);
  Future<dynamic> getById(int productId);
}
