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

  @override
  bool operator ==(Object other) =>
      other is LabelResponse &&
      other.runtimeType == runtimeType &&
      other.labelId == labelId;

  @override
  int get hashCode => labelId.hashCode;
}
