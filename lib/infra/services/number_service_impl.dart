import 'package:intl/intl.dart';
import 'package:lanchonete_app/domain/services/number_service.dart';

class NumberServiceImpl implements NumberService {
  @override
  String numToMoney(num value) {
    final converted = NumberFormat.currency(
      locale: 'pt-BR',
      name: 'R\$',
    ).format(value);

    return converted;
  }
}
