import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/coupon_service.dart';
import 'package:lanchonete_app/infra/models/coupon_all_model.dart';

class CouponServiceImpl implements CouponService {
  final Fetch fetch;

  const CouponServiceImpl({
    required this.fetch,
  });

  @override
  Future<List<CouponAllModel>> getAll() async {
    final data = await fetch.get(route: '/Coupon/All');
    final rows = data as List<dynamic>;
    final models = rows.map((e) => CouponAllModel.fromMap(e)).toList();
    return models;
  }
}
