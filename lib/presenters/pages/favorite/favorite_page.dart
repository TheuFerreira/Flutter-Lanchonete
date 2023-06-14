import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lanchonete_app/presenters/pages/favorite/favorite_controller.dart';
import 'package:lanchonete_app/presenters/pages/home/product_grid.dart';
import 'package:lanchonete_app/presenters/utils/page_status.dart';
import 'package:lanchonete_app/presenters/widgets/card_product_widget.dart';
import 'package:lanchonete_app/presenters/widgets/search_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final scrollController = ScrollController();
  final controller = FavoriteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Favoritos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        controller: scrollController,
        child: Column(
          children: [
            const SizedBox(height: 16),
            SearchWidget(
              controller: controller.searchController,
              onChanged: (_) => controller.onSearch(),
            ),
            const SizedBox(height: 16),
            Observer(builder: (context) {
              final products = controller.products.toList();
              final isLoading = controller.productStatus == PageStatus.loading;
              if (isLoading) {
                products.addAll([
                  ProductGrid(),
                  ProductGrid(),
                ]);
              }

              return GridView.count(
                controller: scrollController,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                children: products
                    .map(
                      (e) => CardProductWidget(
                        product: e,
                        isLoading: isLoading,
                        onTap: (product) =>
                            controller.onTapProduct(context, product),
                        onTapFavorite: controller.onTapFavorite,
                      ),
                    )
                    .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
