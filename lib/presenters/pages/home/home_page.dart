import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/presenters/pages/home/home_controller.dart';
import 'package:lanchonete_app/presenters/pages/home/widgets/card_product_widget.dart';
import 'package:lanchonete_app/presenters/pages/home/widgets/search_widget.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';
import 'package:lanchonete_app/presenters/utils/page_status.dart';
import 'package:lanchonete_app/presenters/widgets/label_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  ...[1, 2, 3, 4, 5, 6].map(
                    (e) => Card(
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      borderOnForeground: false,
                      child: SizedBox(
                        height: 110,
                        width: 225,
                        child: Image.asset(
                          'assets/images/cupon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                children: [
                  const Expanded(
                    child: SearchWidget(),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Observer(builder: (context) {
              final labels = controller.labels;
              final isLoading = controller.status == PageStatus.loading;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ShimmerWidget(
                  isLoading: isLoading,
                  height: 30,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        ...labels.map(
                          (e) {
                            final hasMargin =
                                labels.indexOf(e) < labels.length - 1;
                            return LabelWidget(
                              label: e,
                              hasMargin: hasMargin,
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Mais populares',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Observer(builder: (context) {
                    final isLoading = controller.status == PageStatus.loading;
                    List<ProductGridResponse> products =
                        controller.mostPopular.toList();
                    if (isLoading) {
                      products.addAll([
                        ProductGridResponse(),
                        ProductGridResponse(),
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
                            ),
                          )
                          .toList(),
                    );
                  }),
                  const SizedBox(height: 12),
                  const Text(
                    'Produtos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Observer(builder: (context) {
                    final isLoading = controller.status == PageStatus.loading;
                    List<ProductGridResponse> products =
                        controller.products.toList();
                    if (isLoading) {
                      products.addAll([
                        ProductGridResponse(),
                        ProductGridResponse(),
                      ]);
                    }
                    return GridView.count(
                      controller: scrollController,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      padding: const EdgeInsets.only(bottom: 16),
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      children: products
                          .map(
                            (e) => CardProductWidget(
                              product: e,
                              isLoading: isLoading,
                              onTap: (product) =>
                                  controller.onTapProduct(context, product),
                            ),
                          )
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
