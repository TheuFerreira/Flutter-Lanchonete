import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lanchonete_app/presenters/pages/home/product_grid.dart';
import 'package:lanchonete_app/presenters/pages/product/product_controller.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/add_to_cart_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/carousell_image_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/favorite_button_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/info_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/list_labels_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/quantity_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/rating_full_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/total_price_widget.dart';
import 'package:lanchonete_app/presenters/utils/page_status.dart';
import 'package:lanchonete_app/presenters/widgets/badge_icon_widget.dart';

class ProductPage extends StatefulWidget {
  final ProductGrid product;
  const ProductPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductController controller;

  @override
  void initState() {
    super.initState();

    controller = ProductController(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          BadgeIconWidget(
            value: '1',
            top: 0,
            badgeColor: const Color.fromARGB(255, 235, 143, 5),
            iconData: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onTap: () {
              // TODO: Cart
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        final product = controller.product;
        final labels = product.labels;
        final isLoading = controller.status == PageStatus.loading;
        final isNotFound = controller.status == PageStatus.notFound;
        if (isNotFound) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/hamburger.png',
                  width: 175,
                ),
                const Text(
                  'Product not found',
                  style: TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(255, 235, 143, 5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        CarousellImageWidget(
                          width: double.infinity,
                          height: 400 - 24,
                          images: product.photos,
                          selectedImage: controller.selectedPhoto,
                          onSlider: controller.updateSelectedPhoto,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, bottom: 4),
                        child: FavoriteButtonWidget(
                          favorited: controller.favorite,
                          onTap: controller.updateFavorite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ShimmerWidget(
                      isLoading: isLoading,
                      height: 26,
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingFullWidget(
                                isLoading: isLoading,
                                rating: product.rating,
                                totalRatings: product.totalRatings,
                              ),
                              const SizedBox(height: 12),
                              QuantityWidget(
                                quantity: controller.quantity.toString(),
                                onSubtract: () => controller
                                    .changeQuantity(controller.quantity - 1),
                                onAdd: () => controller
                                    .changeQuantity(controller.quantity + 1),
                              ),
                            ],
                          ),
                          ShimmerWidget(
                            isLoading: isLoading,
                            width: 125,
                            height: 32,
                            child: Text(
                              product.priceStr,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ShimmerWidget(
                      isLoading: isLoading,
                      height: 20,
                      child: Row(
                        children: [
                          InfoWidget(
                            icon: Icons.fastfood_outlined,
                            text: product.calories,
                          ),
                          InfoWidget(
                            icon: Icons.timer_sharp,
                            text: product.preparationTime,
                            show: product.preparationTime != '',
                          ),
                          InfoWidget(
                            icon: Icons.motorcycle,
                            text: '${product.tax} de taxa',
                            hasMargin: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Detalhes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ShimmerWidget(
                      isLoading: isLoading,
                      height: 75,
                      child: Text(product.description),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Categorias',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ListLabelsWidget(
                      isLoading: isLoading,
                      labels: labels,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: Observer(builder: (context) {
        final isLoading = controller.status == PageStatus.loading;
        final isNotFound = controller.status == PageStatus.notFound;
        if (isNotFound) {
          return Container(height: 0);
        }

        return Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              TotalPriceWidget(
                isLoading: isLoading,
                value: controller.totalPriceStr,
              ),
              const SizedBox(width: 24),
              AddToCartWidget(
                isLoading: isLoading,
                onTap: () => controller.addToCart(),
                text: 'Adicionar ao carrinho',
              ),
            ],
          ),
        );
      }),
    );
  }
}
