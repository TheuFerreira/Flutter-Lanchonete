import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/coupon_service.dart';

class CouponServiceImpl implements CouponService {
  final Fetch fetch;

  const CouponServiceImpl({
    required this.fetch,
  });

  @override
  Future<List<dynamic>> getAll() async {
    final data = await fetch.get(route: '/Coupon/All');
    return data;
  }
}
