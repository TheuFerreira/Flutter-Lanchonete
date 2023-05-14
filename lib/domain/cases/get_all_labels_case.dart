import 'dart:convert';

import 'package:lanchonete_app/domain/responses/label_response.dart';
import 'package:lanchonete_app/domain/services/label_service.dart';

abstract class GetAllLabelsCase {
  Future<List<LabelResponse>> call();
}

class GetAllLabelsCaseImpl implements GetAllLabelsCase {
  final LabelService _labelService;

  const GetAllLabelsCaseImpl(this._labelService);

  @override
  Future<List<LabelResponse>> call() async {
    final models = await _labelService.getAll();

    final labels = models
        .map((e) => LabelResponse(
              labelId: e.labelId,
              description: e.description,
              photo: base64Decode(e.photo),
            ))
        .toList();

    return labels;
  }
}
