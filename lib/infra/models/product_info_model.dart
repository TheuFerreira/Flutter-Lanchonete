import 'package:lanchonete_app/infra/models/label_info_model.dart';

class ProductInfoModel {
  final int productId;
  final String title;
  final String description;
  final num rating;
  final num totalRatings;
  final num price;
  final num calories;
  final num tax;
  final String preparationTime;
  late List<LabelInfoModel>? labels;
  late List<String>? images;

  ProductInfoModel({
    required this.productId,
    required this.title,
    required this.description,
    required this.rating,
    required this.totalRatings,
    required this.price,
    required this.calories,
    required this.tax,
    required this.preparationTime,
    this.labels,
    this.images,
  });

  factory ProductInfoModel.fromMap(Map<String, dynamic> map) {
    return ProductInfoModel(
      productId: map['product_id'],
      title: map['title'],
      description: map['description'],
      rating: map['rating'],
      totalRatings: map['total_ratings'],
      price: map['price'],
      calories: map['calories'],
      tax: map['tax'],
      preparationTime: map['preparation_time'],
    );
  }
}
