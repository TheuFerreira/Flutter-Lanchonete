import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/app_widget.dart';
import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/cases/get_all_best_sellers_products_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_coupons_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_labels_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_products_case.dart';
import 'package:lanchonete_app/domain/cases/get_favorited_products_case.dart';
import 'package:lanchonete_app/domain/cases/get_product_by_id_case.dart';
import 'package:lanchonete_app/domain/cases/update_favorite_of_product_case.dart';
import 'package:lanchonete_app/domain/services/coupon_service.dart';
import 'package:lanchonete_app/domain/services/label_service.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';
import 'package:lanchonete_app/domain/services/product_service.dart';
import 'package:lanchonete_app/infra/services/coupon_service_impl.dart';
import 'package:lanchonete_app/infra/services/label_service_impl.dart';
import 'package:lanchonete_app/infra/services/number_service_impl.dart';
import 'package:lanchonete_app/infra/services/product_service_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  final apiUrl = dotenv.get('API_URL');

  final injector = Injector.appInstance;
  injector.registerSingleton(() {
    return Fetch(apiUrl: apiUrl);
  });

  injector.registerDependency<NumberService>(() {
    return NumberServiceImpl();
  });

  injector.registerDependency<ProductService>(() {
    final fetch = injector.get<Fetch>();
    return ProductServiceImpl(fetch: fetch);
  });

  injector.registerDependency<LabelService>(() {
    final fetch = injector.get<Fetch>();
    return LabelServiceImpl(fetch: fetch);
  });

  injector.registerDependency<CouponService>(() {
    final fetch = injector.get<Fetch>();
    return CouponServiceImpl(fetch: fetch);
  });

  injector.registerDependency<GetProductByIdCase>(() {
    final numberService = injector.get<NumberService>();
    final productService = injector.get<ProductService>();
    return GetProductByIdCaseImpl(numberService, productService);
  });

  injector.registerDependency<GetAllProductsCase>(() {
    final numberService = injector.get<NumberService>();
    final productService = injector.get<ProductService>();
    return GetAllProductsCaseImpl(numberService, productService);
  });

  injector.registerDependency<GetAllLabelsCase>(() {
    final labelService = injector.get<LabelService>();
    return GetAllLabelsCaseImpl(labelService);
  });

  injector.registerDependency<GetAllCouponsCase>(() {
    final couponService = injector.get<CouponService>();
    return GetAllCouponsCaseImpl(couponService);
  });

  injector.registerDependency<GetAllBestSellersProductsCase>(() {
    final productService = injector.get<ProductService>();
    final numberService = injector.get<NumberService>();
    return GetAllBestSellersProductsCaseImpl(productService, numberService);
  });

  injector.registerDependency<UpdateFavoriteOfProductCase>(() {
    final productService = injector.get<ProductService>();
    return UpdateFavoriteOfProductCaseImpl(productService);
  });

  injector.registerDependency<GetFavoritedProductsCase>(() {
    final productService = injector.get<ProductService>();
    final numberService = injector.get<NumberService>();

    return GetFavoritedProductsCaseImpl(productService, numberService);
  });

  runApp(const AppWidget());
}
