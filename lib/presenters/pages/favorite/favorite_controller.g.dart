// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteController on FavoriteControllerBase, Store {
  late final _$productStatusAtom =
      Atom(name: 'FavoriteControllerBase.productStatus', context: context);

  @override
  PageStatus get productStatus {
    _$productStatusAtom.reportRead();
    return super.productStatus;
  }

  @override
  set productStatus(PageStatus value) {
    _$productStatusAtom.reportWrite(value, super.productStatus, () {
      super.productStatus = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'FavoriteControllerBase.products', context: context);

  @override
  ObservableList<ProductGrid> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductGrid> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$FavoriteControllerBaseActionController =
      ActionController(name: 'FavoriteControllerBase', context: context);

  @override
  void load() {
    final _$actionInfo = _$FavoriteControllerBaseActionController.startAction(
        name: 'FavoriteControllerBase.load');
    try {
      return super.load();
    } finally {
      _$FavoriteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapFavorite(ProductGrid product) {
    final _$actionInfo = _$FavoriteControllerBaseActionController.startAction(
        name: 'FavoriteControllerBase.onTapFavorite');
    try {
      return super.onTapFavorite(product);
    } finally {
      _$FavoriteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productStatus: ${productStatus},
products: ${products}
    ''';
  }
}
