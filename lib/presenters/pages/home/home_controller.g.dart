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

  late final _$mostPopularAtom =
      Atom(name: 'BaseHomeController.mostPopular', context: context);

  @override
  ObservableList<ProductGridResponse> get mostPopular {
    _$mostPopularAtom.reportRead();
    return super.mostPopular;
  }

  @override
  set mostPopular(ObservableList<ProductGridResponse> value) {
    _$mostPopularAtom.reportWrite(value, super.mostPopular, () {
      super.mostPopular = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'BaseHomeController.products', context: context);

  @override
  ObservableList<ProductGridResponse> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductGridResponse> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$BaseHomeControllerActionController =
      ActionController(name: 'BaseHomeController', context: context);

  @override
  void load() {
    final _$actionInfo = _$BaseHomeControllerActionController.startAction(
        name: 'BaseHomeController.load');
    try {
      return super.load();
    } finally {
      _$BaseHomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
coupons: ${coupons},
labels: ${labels},
mostPopular: ${mostPopular},
products: ${products}
    ''';
  }
}
