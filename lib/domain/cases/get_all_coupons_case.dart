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
    final models = await _couponService.getAll();
    final labels = models.map((e) {
      return CouponResponse(
        couponId: e.couponId,
        photo: base64Decode(e.image),
      );
    }).toList();

    return labels;
  }
}
