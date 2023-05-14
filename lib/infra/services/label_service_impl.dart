import 'package:lanchonete_app/core/fetch.dart';
import 'package:lanchonete_app/domain/services/label_service.dart';
import 'package:lanchonete_app/infra/models/label_info_model.dart';

class LabelServiceImpl implements LabelService {
  final Fetch fetch;

  const LabelServiceImpl({
    required this.fetch,
  });

  @override
  Future<List<LabelInfoModel>> getAll() async {
    final data = await fetch.get(route: '/Label/All');
    final rows = data as List<dynamic>;
    final models = rows.map((e) => LabelInfoModel.fromMap(e)).toList();
    return models;
  }
}
