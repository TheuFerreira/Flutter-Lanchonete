import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/label_service.dart';

class LabelServiceImpl implements LabelService {
  final Fetch fetch;

  const LabelServiceImpl({
    required this.fetch,
  });

  @override
  Future<List<dynamic>> getAll() async {
    final data = await fetch.get(route: '/Label/All');
    return data;
  }
}
