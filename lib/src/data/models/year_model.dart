import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

class YearModel extends YearModelEntity {
  const YearModel({
    required super.label,
    required super.value,
  });

  factory YearModel.fromJson(Map<String, dynamic> json) => YearModel(
        label: json["Label"] ?? '',
        value: json["Value"] ?? '',
      );
}
