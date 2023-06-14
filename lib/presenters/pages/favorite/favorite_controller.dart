import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/domain/cases/get_favorited_products_case.dart';
import 'package:lanchonete_app/domain/cases/update_favorite_of_product_case.dart';
import 'package:lanchonete_app/presenters/pages/home/product_grid.dart';
import 'package:lanchonete_app/presenters/pages/product/product_page.dart';
import 'package:lanchonete_app/presenters/utils/page_status.dart';
import 'package:mobx/mobx.dart';

part 'favorite_controller.g.dart';

class FavoriteController = FavoriteControllerBase with _$FavoriteController;

abstract class FavoriteControllerBase with Store {
  final searchController = TextEditingController();

  @observable
  PageStatus productStatus = PageStatus.loading;

  @observable
  ObservableList<ProductGrid> products = ObservableList.of([]);

  final _injector = Injector.appInstance;

  FavoriteControllerBase() {
    load();
  }

  @action
  void load() => _load();
  Future _load() async {
    productStatus = PageStatus.loading;
    products.clear();

    final getFavoritedProductsCase = _injector.get<GetFavoritedProductsCase>();
    final ls = await getFavoritedProductsCase(search: searchController.text);
    final productGrid = ls.map((e) => ProductGrid.factory(e));
    products.addAll(productGrid);

    productStatus = PageStatus.completed;
  }

  void onSearch() => _load();

  @action
  void onTapFavorite(ProductGrid product) => _onTapFavorite(product);
  Future<void> _onTapFavorite(ProductGrid product) async {
    final updateFavoriteOfProductCase =
        _injector.get<UpdateFavoriteOfProductCase>();

    final newValue = await updateFavoriteOfProductCase(product.productId);
    if (!newValue) {
      products.remove(product);
    }
  }

  void onTapProduct(BuildContext context, ProductGrid product) {
    Navigator.of(context)
        .push(MaterialPageRoute(
          builder: (builder) => ProductPage(product: product),
        ))
        .then((value) => load());
  }
}
