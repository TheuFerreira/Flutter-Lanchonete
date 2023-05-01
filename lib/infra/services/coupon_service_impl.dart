import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/services/coupon_service.dart';

class CouponServiceImpl implements CouponService {
  final String _apiUrl;

  const CouponServiceImpl(this._apiUrl);

  @override
  Future<List<dynamic>> getAll() async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Coupon/All');
    final data = response.data;
    return data;
  }
}
