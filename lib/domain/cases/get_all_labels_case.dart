import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';

abstract class GetAllLabelsCase {
  Future<List<LabelResponse>> call();
}

class GetAllLabelsCaseImpl implements GetAllLabelsCase {
  final String _apiUrl;

  const GetAllLabelsCaseImpl(this._apiUrl);

  @override
  Future<List<LabelResponse>> call() async {
    final dio = Dio();
    final response = await dio.get('$_apiUrl/Label/All');
    final data = response.data;

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
