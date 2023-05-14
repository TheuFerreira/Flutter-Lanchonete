class CouponAllModel {
  final int couponId;
  final String image;

  const CouponAllModel({
    required this.couponId,
    required this.image,
  });

  factory CouponAllModel.fromMap(Map<String, dynamic> map) {
    return CouponAllModel(
      couponId: map['coupon_id'],
      image: map['image'],
    );
  }
}
