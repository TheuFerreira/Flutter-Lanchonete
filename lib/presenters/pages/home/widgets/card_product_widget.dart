import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lanchonete_app/presenters/pages/home/product_grid.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';

class CardProductWidget extends StatelessWidget {
  final bool isLoading;
  final ProductGrid product;
  final Function(ProductGrid product) onTap;
  final Function(ProductGrid product) onTapFavorite;
  const CardProductWidget({
    super.key,
    required this.product,
    required this.isLoading,
    required this.onTap,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      isLoading: isLoading,
      child: InkWell(
        onTap: () => onTap(product),
        borderRadius: BorderRadius.circular(8),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: product.photo == null
                          ? Container()
                          : Image.memory(
                              product.photo!,
                              fit: BoxFit.contain,
                            ),
                    ),
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Observer(
                        builder: (context) {
                          return IconButton(
                            onPressed: () => onTapFavorite(product),
                            color: const Color.fromARGB(255, 235, 143, 5),
                            icon: Icon(
                              product.favorite
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_outline,
                              size: 24,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.price,
                          style: const TextStyle(fontSize: 13),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Color.fromARGB(255, 235, 143, 5),
                            ),
                            Text(
                              '${product.rating}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
