import 'dart:convert';

import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/cart_product_service.dart';

class CartProductServiceImpl implements CartProductService {
  final Fetch fetch;

  const CartProductServiceImpl({required this.fetch});

  @override
  Future<void> save(Object parameters) async {
    final json = jsonEncode(parameters);

    await fetch.post(route: '/CartProduct/Save', params: json);
  }

  @override
  Future<int> count() async {
    final data = await fetch.get(route: '/CartProduct/Count');
    return data;
  }
}
