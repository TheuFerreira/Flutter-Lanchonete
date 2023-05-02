import 'package:flutter/material.dart';
import 'package:lanchonete_app/domain/responses/coupon_response.dart';

class CardCouponWidget extends StatelessWidget {
  final CouponResponse coupon;
  final void Function(CouponResponse) onTap;
  const CardCouponWidget({
    super.key,
    required this.coupon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(coupon),
      borderRadius: BorderRadius.circular(8),
      child: Card(
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
      ),
    );
  }
}
