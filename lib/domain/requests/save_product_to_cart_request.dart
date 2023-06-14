class SaveProductToCartRequest {
  final int productId;
  final num quantity;

  const SaveProductToCartRequest({
    required this.productId,
    required this.quantity,
  });
}
