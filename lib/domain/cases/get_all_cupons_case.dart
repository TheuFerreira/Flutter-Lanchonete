import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/responses/coupon_response.dart';

abstract class GetAllCouponsCase {
  Future<List<CouponResponse>> call();
}

class GetAllCouponsCaseImpl implements GetAllCouponsCase {
  final String _apiUrl;

  const GetAllCouponsCaseImpl(this._apiUrl);

  @override
  Future<List<CouponResponse>> call() async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Coupon/All');
    final data = response.data;

    List<CouponResponse> labels = [];
    for (final map in data) {
      final couponId = map['coupon_id'];
      final image = map['image'];
      final photo = base64Decode(image);

      final label = CouponResponse(
        couponId: couponId,
        photo: photo,
      );

      labels.add(label);
    }

    return labels;
  }
}
