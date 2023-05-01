import 'dart:typed_data';

class ProductGridResponse {
  late int productId;
  late String title;
  late String price;
  late num rating;
  late Uint8List? photo;

  ProductGridResponse({
    this.productId = 0,
    this.title = '',
    this.price = '',
    this.rating = 0,
    this.photo,
  });
}
