import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/domain/cases/get_product_by_id_case.dart';
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
  int quantity = 1;

  @observable
  String totalPriceStr = '';

  @observable
  int selectedPhoto = 0;

  final _injector = Injector.appInstance;

  BaseProductController(ProductGridResponse product) {
    load(product.productId);
  }

  @action
  load(int productId) => _load(productId);
  _load(int productId) async {
    status = PageStatus.loading;

    final getProductByIdCase = _injector.get<GetProductByIdCase>();
    product = await getProductByIdCase(productId);

    _calculateTotalPrice();
    status = PageStatus.completed;
  }

  toPreviousPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  @action
  updateSelectedPhoto(int index) {
    selectedPhoto = index;
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
