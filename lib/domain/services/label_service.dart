import 'package:lanchonete_app/infra/models/label_info_model.dart';

abstract class LabelService {
  Future<List<LabelInfoModel>> getAll();
}
