import 'package:flutter/material.dart';
import 'package:lanchonete_app/domain/responses/coupon_response.dart';

class CardCouponWidget extends StatelessWidget {
  final CouponResponse coupon;
  const CardCouponWidget({
    super.key,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      borderOnForeground: false,
      child: SizedBox(
        height: 120,
        width: 225,
        child: Image.memory(
          coupon.photo!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
