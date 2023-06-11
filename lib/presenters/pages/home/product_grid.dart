import 'dart:typed_data';

import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:mobx/mobx.dart';

part 'product_grid.g.dart';

class ProductGrid = ProductGridBase with _$ProductGrid;

abstract class ProductGridBase with Store {
  late int productId;
  late String title;
  late String price;
  late num rating;
  late Uint8List? photo;

  @observable
  bool favorite = false;

  ProductGridBase({
    this.productId = 0,
    this.title = '',
    this.price = '',
    this.rating = 0,
    this.photo,
    this.favorite = false,
  });

  ProductGridBase.factory(ProductGridResponse response) {
    productId = response.productId;
    title = response.title;
    price = response.price;
    rating = response.rating;
    photo = response.photo;
    favorite = response.favorite;
  }

  @action
  void updateFavorite(bool newValue) {
    favorite = newValue;
  }

  @override
  bool operator ==(Object other) =>
      other is ProductGridBase &&
      other.runtimeType == runtimeType &&
      other.productId == productId;

  @override
  int get hashCode => productId.hashCode;
}
