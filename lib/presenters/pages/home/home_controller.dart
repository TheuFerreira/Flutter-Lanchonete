import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/domain/cases/get_all_coupons_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_labels_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_products_case.dart';
import 'package:lanchonete_app/domain/responses/coupon_response.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';
import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/presenters/pages/product/product_page.dart';
import 'package:lanchonete_app/presenters/utils/page_status.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = BaseHomeController with _$HomeController;

abstract class BaseHomeController with Store {
  final searchController = TextEditingController();

  @observable
  PageStatus status = PageStatus.loading;

  @observable
  PageStatus productStatus = PageStatus.loading;

  @observable
  ObservableList<CouponResponse> coupons = ObservableList.of([]);

  @observable
  ObservableList<LabelResponse> labels = ObservableList.of([]);

  @observable
  ObservableList<LabelResponse> selectedLabels = ObservableList.of([]);

  @observable
  ObservableList<ProductGridResponse> mostPopular = ObservableList.of([]);

  @observable
  ObservableList<ProductGridResponse> products = ObservableList.of([]);

  final _injector = Injector.appInstance;

  BaseHomeController() {
    load();
  }

  @action
  void load() => _load();
  void _load() async {
    status = PageStatus.loading;

    await _loadCoupons();
    await _loadLabels();
    await _loadMostPopular();
    await _loadProducts();

    status = PageStatus.completed;
  }

  Future<void> _loadCoupons() async {
    final getAllCouponsCase = _injector.get<GetAllCouponsCase>();
    final ls = await getAllCouponsCase();
    coupons.addAll(ls);
  }

  Future<void> _loadLabels() async {
    final getAllLabelsCase = _injector.get<GetAllLabelsCase>();
    final ls = await getAllLabelsCase();
    labels.addAll(ls);
  }

  Future<void> _loadMostPopular() async {
    final getAllProductsCase = _injector.get<GetAllProductsCase>();
    final ls = await getAllProductsCase();
    mostPopular.addAll(ls);
  }

  @action
  void onSearch(String? value) => _search(value);
  Future<void> _search(String? value) async {
    await _loadProducts();
  }

  @action
  void tapLabel(LabelResponse label) => _tapLabel(label);
  Future _tapLabel(LabelResponse label) async {
    final contains = selectedLabels.contains(label);
    if (contains) {
      selectedLabels.remove(label);
    } else {
      selectedLabels.add(label);
    }

    await _loadProducts();
  }

  Future<void> _loadProducts() async {
    final categories = selectedLabels.isEmpty
        ? null
        : selectedLabels.map((e) => e.labelId).toList();

    final search = searchController.text.isEmpty ? null : searchController.text;

    productStatus = PageStatus.loading;
    products.clear();

    final getAllProductsCase = _injector.get<GetAllProductsCase>();
    final ls = await getAllProductsCase(categories: categories, search: search);
    products.addAll(ls);

    productStatus = PageStatus.completed;
  }

  void onTapProduct(BuildContext context, ProductGridResponse product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => ProductPage(product: product),
      ),
    );
  }
}
