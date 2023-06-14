import 'package:lanchonete_app/domain/requests/save_product_to_cart_request.dart';
import 'package:lanchonete_app/domain/services/cart_product_service.dart';

abstract class SaveProductToCartCase {
  Future<void> call(SaveProductToCartRequest request);
}

class SaveProductToCartCaseImpl implements SaveProductToCartCase {
  final CartProductService _cartProductService;

  const SaveProductToCartCaseImpl(this._cartProductService);

  @override
  Future<void> call(SaveProductToCartRequest request) async {
    final parameters = {
      'id_product': request.productId,
      'quantity': request.quantity,
    };

    await _cartProductService.save(parameters);
  }
}
