// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on BaseProductController, Store {
  late final _$productAtom =
      Atom(name: 'BaseProductController.product', context: context);

  @override
  ProductInfoResponse get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ProductInfoResponse value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'BaseProductController.status', context: context);

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

  late final _$quantityAtom =
      Atom(name: 'BaseProductController.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$totalPriceStrAtom =
      Atom(name: 'BaseProductController.totalPriceStr', context: context);

  @override
  String get totalPriceStr {
    _$totalPriceStrAtom.reportRead();
    return super.totalPriceStr;
  }

  @override
  set totalPriceStr(String value) {
    _$totalPriceStrAtom.reportWrite(value, super.totalPriceStr, () {
      super.totalPriceStr = value;
    });
  }

  late final _$selectedPhotoAtom =
      Atom(name: 'BaseProductController.selectedPhoto', context: context);

  @override
  int get selectedPhoto {
    _$selectedPhotoAtom.reportRead();
    return super.selectedPhoto;
  }

  @override
  set selectedPhoto(int value) {
    _$selectedPhotoAtom.reportWrite(value, super.selectedPhoto, () {
      super.selectedPhoto = value;
    });
  }

  late final _$BaseProductControllerActionController =
      ActionController(name: 'BaseProductController', context: context);

  @override
  dynamic load(int productId) {
    final _$actionInfo = _$BaseProductControllerActionController.startAction(
        name: 'BaseProductController.load');
    try {
      return super.load(productId);
    } finally {
      _$BaseProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateSelectedPhoto(int index) {
    final _$actionInfo = _$BaseProductControllerActionController.startAction(
        name: 'BaseProductController.updateSelectedPhoto');
    try {
      return super.updateSelectedPhoto(index);
    } finally {
      _$BaseProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeQuantity(int newQuantity) {
    final _$actionInfo = _$BaseProductControllerActionController.startAction(
        name: 'BaseProductController.changeQuantity');
    try {
      return super.changeQuantity(newQuantity);
    } finally {
      _$BaseProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
status: ${status},
quantity: ${quantity},
totalPriceStr: ${totalPriceStr},
selectedPhoto: ${selectedPhoto}
    ''';
  }
}
