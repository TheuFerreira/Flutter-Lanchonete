import 'dart:typed_data';

class LabelResponse {
  late int labelId;
  late String description;
  late Uint8List? photo;

  LabelResponse({
    this.labelId = 0,
    this.description = '',
    this.photo,
  });
}
