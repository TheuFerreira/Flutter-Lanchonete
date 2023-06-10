import 'dart:typed_data';

import 'package:lanchonete_app/domain/responses/label_response.dart';

class ProductInfoResponse {
  late String title;
  late String description;
  late String priceStr;
  late double rating;
  late String totalRatings;
  late String calories;
  late String tax;
  late String preparationTime;
  late List<Uint8List>? photos;
  late List<LabelResponse>? labels;
  late bool favorite;

  late num price;

  ProductInfoResponse({
    this.title = '',
    this.description = '',
    this.priceStr = '',
    this.price = 0,
    this.rating = 0,
    this.totalRatings = '',
    this.calories = '',
    this.tax = '',
    this.preparationTime = '',
    this.photos,
    this.labels,
    this.favorite = false,
  });
}
