abstract class ProductService {
  Future<List<dynamic>> getAll();
  Future<dynamic> getById(int productId);
}
