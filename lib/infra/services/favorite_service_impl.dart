import 'dart:convert';

import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/favorite_service.dart';
import 'package:lanchonete_app/infra/models/product_grid_model.dart';

class FavoriteServiceImpl implements FavoriteService {
  final Fetch fetch;

  const FavoriteServiceImpl({
    required this.fetch,
  });

  @override
  Future<bool> update(int productId) async {
    final params = {"product_id": productId};

    final result = await fetch.put(
      route: '/Favorite/Favorite',
      params: params,
    );
    return result;
  }

  @override
  Future<List<ProductGridModel>> search(Object parameters) async {
    final json = jsonEncode(parameters);

    final data = await fetch.post(
      route: '/Favorite/Search',
      params: json,
    );
    final rows = data as List<dynamic>;
    final models = rows.map((e) => ProductGridModel.fromMap(e)).toList();
    return models;
  }

  @override
  Future<int> count() async {
    final data = await fetch.get(
      route: '/Favorite/Count',
    );
    return data;
  }
}
