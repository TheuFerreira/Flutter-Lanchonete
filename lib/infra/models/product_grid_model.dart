class ProductGridModel {
  final int productId;
  final String title;
  final num rating;
  final num price;
  final String image;

  const ProductGridModel({
    required this.productId,
    required this.title,
    required this.rating,
    required this.price,
    required this.image,
  });

  factory ProductGridModel.fromMap(Map<String, dynamic> map) {
    return ProductGridModel(
      productId: map['product_id'],
      title: map['title'],
      rating: map['rating'],
      price: map['price'],
      image: map['image'],
    );
  }
}
