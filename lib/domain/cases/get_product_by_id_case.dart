import 'dart:convert';

import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/errors/product_exception.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';
import 'package:lanchonete_app/domain/responses/product_info_response.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';
import 'package:lanchonete_app/infra/models/product_info_model.dart';

abstract class GetProductByIdCase {
  Future<ProductInfoResponse> call(int productId);
}

class GetProductByIdCaseImpl implements GetProductByIdCase {
  final NumberService _numberService;
  final ProductService _productService;

  const GetProductByIdCaseImpl(
    this._numberService,
    this._productService,
  );

  @override
  Future<ProductInfoResponse> call(int productId) async {
    ProductInfoModel info;
    try {
      info = await _productService.getById(productId);
    } on FetchNotFoundException {
      throw ProductNotFoundException();
    }

    final priceConverted = _numberService.numToMoney(info.price);

    final num rating = info.rating;
    final totalRatings = info.totalRatings.toInt();

    final int calories = info.calories.toInt();
    final caloriesStr = '${calories}cal';

    final num tax = info.tax;
    final taxStr = _numberService.numToMoney(tax);

    final photos = info.images!.map((e) => base64Decode(e)).toList();

    final labels = info.labels!
        .map(
          (e) => LabelResponse(
            labelId: e.labelId,
            description: e.description,
            photo: base64Decode(e.photo),
          ),
        )
        .toList();

    final product = ProductInfoResponse(
      title: info.title,
      description: info.description,
      priceStr: priceConverted,
      price: info.price,
      rating: rating.toDouble(),
      totalRatings: totalRatings.toString(),
      calories: caloriesStr,
      tax: taxStr,
      preparationTime: info.preparationTime,
      photos: photos,
      labels: labels,
    );

    return product;
  }
}
