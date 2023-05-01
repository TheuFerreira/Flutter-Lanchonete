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
    final data = await _labelService.getAll();

    List<LabelResponse> labels = [];
    for (final map in data) {
      final labelId = map['label_id'];
      final description = map['description'];
      final image = map['image'];
      final photo = base64Decode(image);

      final label = LabelResponse(
        labelId: labelId,
        description: description,
        photo: photo,
      );

      labels.add(label);
    }

    return labels;
  }
}
