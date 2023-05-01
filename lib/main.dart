import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';
import 'package:lanchonete_app/app_widget.dart';
import 'package:lanchonete_app/domain/cases/get_all_cupons_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_labels_case.dart';
import 'package:lanchonete_app/domain/cases/get_all_products_case.dart';
import 'package:lanchonete_app/domain/cases/get_product_by_id_case.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';
import 'package:lanchonete_app/infra/services/number_service_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  final apiUrl = dotenv.get('API_URL');

  final injector = Injector.appInstance;
  injector.registerDependency<NumberService>(() {
    return NumberServiceImpl();
  });

  injector.registerDependency<GetProductByIdCase>(() {
    final numberService = injector.get<NumberService>();
    return GetProductByIdCaseImpl(numberService, apiUrl);
  });

  injector.registerDependency<GetAllProductsCase>(() {
    final numberService = injector.get<NumberService>();
    return GetAllProductsCaseImpl(numberService, apiUrl);
  });

  injector.registerDependency<GetAllLabelsCase>(() {
    return GetAllLabelsCaseImpl(apiUrl);
  });

  injector.registerDependency<GetAllCouponsCase>(() {
    return GetAllCouponsCaseImpl(apiUrl);
  });

  runApp(const AppWidget());
}
