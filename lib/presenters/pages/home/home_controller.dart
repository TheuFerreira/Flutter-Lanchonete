import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/domain/cases/get_all_best_sellers_products_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_coupons_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_labels_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_products_case.dart';
import 'package:lanchonete_app/domain/cases/update_favorite_of_product_case.dart';
import 'package:lanchonete_app/domain/responses/coupon_response.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';
import 'package:lanchonete_app/presenters/pages/home/product_grid.dart';
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
  PageStatus bestSellersStatus = PageStatus.loading;

  @observable
  PageStatus productStatus = PageStatus.loading;

  @observable
  ObservableList<CouponResponse> coupons = ObservableList.of([]);

  @observable
  ObservableList<LabelResponse> labels = ObservableList.of([]);

  @observable
  ObservableList<LabelResponse> selectedLabels = ObservableList.of([]);

  @observable
  ObservableList<ProductGrid> bestSellers = ObservableList.of([]);

  @observable
  ObservableList<ProductGrid> products = ObservableList.of([]);

  final _injector = Injector.appInstance;

  BaseHomeController() {
    load();
  }

  Future<void> load() async {
    status = PageStatus.loading;

    await _loadCoupons();
    await _loadLabels();
    await _loadBestSellers();
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

  @action
  void onSearch(String? value) => _search(value);
  Future<void> _search(String? value) async {
    await _loadBestSellers();
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

    await _loadBestSellers();
    await _loadProducts();
  }

  Future<void> _loadBestSellers() async {
    List<int> categories = [];
    if (selectedLabels.isNotEmpty) {
      categories = selectedLabels.map((e) => e.labelId).toList();
    }

    final search = searchController.text.isEmpty ? '' : searchController.text;

    bestSellersStatus = PageStatus.loading;
    bestSellers.clear();

    final getAllBestSellersProductsCase =
        _injector.get<GetAllBestSellersProductsCase>();
    final ls = await getAllBestSellersProductsCase(
        categories: categories, search: search);
    bestSellers.addAll(ls.map((e) => ProductGrid.factory(e)));

    bestSellersStatus = PageStatus.completed;
  }

  Future<void> _loadProducts() async {
    List<int> categories = [];
    if (selectedLabels.isNotEmpty) {
      categories = selectedLabels.map((e) => e.labelId).toList();
    }

    final search = searchController.text.isEmpty ? '' : searchController.text;

    productStatus = PageStatus.loading;
    products.clear();

    final getAllProductsCase = _injector.get<GetAllProductsCase>();
    final ls = await getAllProductsCase(categories: categories, search: search);
    products.addAll(ls.map((e) => ProductGrid.factory(e)));

    productStatus = PageStatus.completed;
  }

  void onTapProduct(BuildContext context, ProductGrid product) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (builder) => ProductPage(product: product),
          ),
        )
        .then((_) => load());
  }

  @action
  void onTapFavorite(ProductGrid product) => _onTapFavorite(product);
  Future<void> _onTapFavorite(ProductGrid product) async {
    final updateFavoriteOfProductCase =
        _injector.get<UpdateFavoriteOfProductCase>();

    final newValue = await updateFavoriteOfProductCase(product.productId);

    final indexBestSeller = bestSellers.indexOf(product);
    bestSellers[indexBestSeller].favorite = newValue;

    final indexProduct = products.indexOf(product);
    products[indexProduct].favorite = newValue;
  }
}
