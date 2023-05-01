import 'dart:convert';

import 'package:lanchonete_app/domain/responses/coupon_response.dart';
import 'package:lanchonete_app/domain/services/coupon_service.dart';

abstract class GetAllCouponsCase {
  Future<List<CouponResponse>> call();
}

class GetAllCouponsCaseImpl implements GetAllCouponsCase {
  final CouponService _couponService;

  const GetAllCouponsCaseImpl(this._couponService);

  @override
  Future<List<CouponResponse>> call() async {
    final data = await _couponService.getAll();

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
