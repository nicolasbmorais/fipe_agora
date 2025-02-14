import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';

class ModelByYearModel extends ModelByYearEntity {
  const ModelByYearModel({
    required super.label,
    required super.value,
  });

  factory ModelByYearModel.fromJson(Map<String, dynamic> json) =>
      ModelByYearModel(
        label: json["Label"],
        value: json["Value"],
      );
}
