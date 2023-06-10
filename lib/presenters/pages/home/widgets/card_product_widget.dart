import 'package:flutter/material.dart';
import 'package:lanchonete_app/domain/responses/product_grid_response.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';

class CardProductWidget extends StatelessWidget {
  final bool isLoading;
  final ProductGridResponse product;
  final Function(ProductGridResponse product) onTap;
  const CardProductWidget({
    super.key,
    required this.product,
    required this.isLoading,
    required this.onTap,
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
                      child: IconButton(
                        onPressed: () {
                          // TODO: Tap unfavorite | favorite
                        },
                        color: const Color.fromARGB(255, 235, 143, 5),
                        icon: Icon(
                          product.favorite
                              ? Icons.favorite_outlined
                              : Icons.favorite_outline,
                          size: 24,
                        ),
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
