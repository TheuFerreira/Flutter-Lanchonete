import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';
import 'package:lanchonete_app/domain/responses/product_info_response.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';

abstract class GetProductByIdCase {
  Future<ProductInfoResponse> call(int productId);
}

class GetProductByIdCaseImpl implements GetProductByIdCase {
  final NumberService _numberService;
  final String _apiUrl;

  const GetProductByIdCaseImpl(
    this._numberService,
    this._apiUrl,
  );

  @override
  Future<ProductInfoResponse> call(int productId) async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Product/ById/$productId');
    final data = response.data;

    final price = data['price'];
    final priceConverted = _numberService.numToMoney(price);

    final num rating = data['rating'];
    final int totalRatings = data['total_ratings'];

    final int calories = data['calories'];
    final caloriesStr = '${calories}g';

    final num tax = data['tax'];
    final taxStr = _numberService.numToMoney(tax);

    final List<dynamic> images = data['images'];
    List<Uint8List> photos = [];
    for (dynamic image in images) {
      final photo = base64Decode(image);
      photos.add(photo);
    }

    final List<dynamic> labelsMap = data['labels'];
    List<LabelResponse> labels = [];
    for (dynamic map in labelsMap) {
      final labelId = map['label_id'];
      final description = map['description'];
      final image = map['photo'];
      final photo = base64Decode(image);

      final label = LabelResponse(
        labelId: labelId,
        description: description,
        photo: photo,
      );
      labels.add(label);
    }

    final product = ProductInfoResponse(
      title: data['title'],
      description: data['description'],
      priceStr: priceConverted,
      price: price,
      rating: rating.toDouble(),
      totalRatings: totalRatings.toString(),
      calories: caloriesStr,
      tax: taxStr,
      preparationTime: data['preparation_time'],
      photos: photos,
      labels: labels,
    );

    return product;
  }
}
