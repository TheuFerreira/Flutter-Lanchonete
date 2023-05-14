class LabelInfoModel {
  final int labelId;
  final String description;
  final String photo;

  const LabelInfoModel({
    required this.labelId,
    required this.description,
    required this.photo,
  });

  factory LabelInfoModel.fromMap(Map<String, dynamic> map) {
    return LabelInfoModel(
      labelId: map['label_id'],
      description: map['description'],
      photo: map['photo'],
    );
  }
}
