// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on BaseHomeController, Store {
  late final _$statusAtom =
      Atom(name: 'BaseHomeController.status', context: context);

  @override
  PageStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(PageStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$bestSellersStatusAtom =
      Atom(name: 'BaseHomeController.bestSellersStatus', context: context);

  @override
  PageStatus get bestSellersStatus {
    _$bestSellersStatusAtom.reportRead();
    return super.bestSellersStatus;
  }

  @override
  set bestSellersStatus(PageStatus value) {
    _$bestSellersStatusAtom.reportWrite(value, super.bestSellersStatus, () {
      super.bestSellersStatus = value;
    });
  }

  late final _$productStatusAtom =
      Atom(name: 'BaseHomeController.productStatus', context: context);

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

  late final _$couponsAtom =
      Atom(name: 'BaseHomeController.coupons', context: context);

  @override
  ObservableList<CouponResponse> get coupons {
    _$couponsAtom.reportRead();
    return super.coupons;
  }

  @override
  set coupons(ObservableList<CouponResponse> value) {
    _$couponsAtom.reportWrite(value, super.coupons, () {
      super.coupons = value;
    });
  }

  late final _$labelsAtom =
      Atom(name: 'BaseHomeController.labels', context: context);

  @override
  ObservableList<LabelResponse> get labels {
    _$labelsAtom.reportRead();
    return super.labels;
  }

  @override
  set labels(ObservableList<LabelResponse> value) {
    _$labelsAtom.reportWrite(value, super.labels, () {
      super.labels = value;
    });
  }

  late final _$selectedLabelsAtom =
      Atom(name: 'BaseHomeController.selectedLabels', context: context);

  @override
  ObservableList<LabelResponse> get selectedLabels {
    _$selectedLabelsAtom.reportRead();
    return super.selectedLabels;
  }

  @override
  set selectedLabels(ObservableList<LabelResponse> value) {
    _$selectedLabelsAtom.reportWrite(value, super.selectedLabels, () {
      super.selectedLabels = value;
    });
  }

  late final _$bestSellersAtom =
      Atom(name: 'BaseHomeController.bestSellers', context: context);

  @override
  ObservableList<ProductGrid> get bestSellers {
    _$bestSellersAtom.reportRead();
    return super.bestSellers;
  }

  @override
  set bestSellers(ObservableList<ProductGrid> value) {
    _$bestSellersAtom.reportWrite(value, super.bestSellers, () {
      super.bestSellers = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'BaseHomeController.products', context: context);

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

  late final _$BaseHomeControllerActionController =
      ActionController(name: 'BaseHomeController', context: context);

  @override
  void onSearch(String? value) {
    final _$actionInfo = _$BaseHomeControllerActionController.startAction(
        name: 'BaseHomeController.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$BaseHomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tapLabel(LabelResponse label) {
    final _$actionInfo = _$BaseHomeControllerActionController.startAction(
        name: 'BaseHomeController.tapLabel');
    try {
      return super.tapLabel(label);
    } finally {
      _$BaseHomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapFavorite(ProductGrid product) {
    final _$actionInfo = _$BaseHomeControllerActionController.startAction(
        name: 'BaseHomeController.onTapFavorite');
    try {
      return super.onTapFavorite(product);
    } finally {
      _$BaseHomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
bestSellersStatus: ${bestSellersStatus},
productStatus: ${productStatus},
coupons: ${coupons},
labels: ${labels},
selectedLabels: ${selectedLabels},
bestSellers: ${bestSellers},
products: ${products}
    ''';
  }
}
