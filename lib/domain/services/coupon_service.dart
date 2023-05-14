import 'package:lanchonete_app/infra/models/coupon_all_model.dart';

abstract class CouponService {
  Future<List<CouponAllModel>> getAll();
}
