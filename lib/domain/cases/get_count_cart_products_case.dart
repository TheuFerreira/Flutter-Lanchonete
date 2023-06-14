import 'package:lanchonete_app/domain/services/cart_product_service.dart';

abstract class GetCountCartProductsCase {
  Future<String?> call();
}

class GetCountCartProductsCaseImpl implements GetCountCartProductsCase {
  final CartProductService _cartProductService;

  const GetCountCartProductsCaseImpl(this._cartProductService);

  @override
  Future<String?> call() async {
    final value = await _cartProductService.count();
    if (value == 0) return null;

    return value.toString();
  }
}
