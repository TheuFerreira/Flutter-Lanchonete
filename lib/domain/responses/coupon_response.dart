import 'dart:typed_data';

class CouponResponse {
  late int couponId;
  late Uint8List? photo;

  CouponResponse({
    required this.couponId,
    required this.photo,
  });
}
