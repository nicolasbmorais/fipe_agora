import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

class YearByModel extends YearByModelEntity {
  const YearByModel({
    required super.code,
    required super.name,
  });

  factory YearByModel.fromJson(Map<String, dynamic> json) => YearByModel(
        code: json["code"] ?? '',
        name: json["name"] ?? '',
      );
}
