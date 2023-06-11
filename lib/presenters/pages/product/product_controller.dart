import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/domain/cases/get_product_by_id_case.dart';
import 'package:lanchonete_app/domain/cases/update_favorite_of_product_case.dart';
import 'package:lanchonete_app/domain/errors/product_exception.dart';
import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/domain/responses/product_info_response.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';
import 'package:lanchonete_app/presenters/utils/page_status.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = BaseProductController with _$ProductController;

abstract class BaseProductController with Store {
  @observable
  ProductInfoResponse product = ProductInfoResponse();

  @observable
  PageStatus status = PageStatus.loading;

  @observable
  bool favorite = false;

  @observable
  int quantity = 1;

  @observable
  String totalPriceStr = '';

  @observable
  int selectedPhoto = 0;

  final _injector = Injector.appInstance;
  late int _productId;

  BaseProductController(ProductGridResponse product) {
    load(product.productId);
    _productId = product.productId;
  }

  @action
  load(int productId) => _load(productId);
  _load(int productId) async {
    status = PageStatus.loading;

    try {
      final getProductByIdCase = _injector.get<GetProductByIdCase>();
      product = await getProductByIdCase(productId);
      favorite = product.favorite;

      _calculateTotalPrice();
      status = PageStatus.completed;
    } on ProductException {
      status = PageStatus.notFound;
    }
  }

  toPreviousPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  @action
  updateSelectedPhoto(int index) {
    selectedPhoto = index;
  }

  @action
  updateFavorite() => _updateFavorite();
  _updateFavorite() async {
    final updateFavoriteOfProductCase =
        _injector.get<UpdateFavoriteOfProductCase>();
    final newValue = await updateFavoriteOfProductCase(_productId);
    favorite = newValue;
  }

  @action
  changeQuantity(int newQuantity) {
    if (newQuantity <= 0) {
      newQuantity = 1;
    }

    quantity = newQuantity;

    _calculateTotalPrice();
  }

  _calculateTotalPrice() {
    final totalPrice = (product.price * quantity).toDouble();

    final numberService = _injector.get<NumberService>();
    totalPriceStr = numberService.numToMoney(totalPrice);
  }
}
