import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

class YearByModel extends YearByModelEntity {
  const YearByModel({
    required super.code,
    required super.name,
  });

  factory YearByModel.fromJson(Map<String, dynamic> json) {
    String yearRaw = json["name"].toString().trim();
    String codeRaw = json["code"].toString().trim();

    if (yearRaw.startsWith('32000')) {
      yearRaw = yearRaw.replaceFirst('32000', '0km').trim();
    }

    return YearByModel(
      code: codeRaw,
      name: yearRaw,
    );
  }
}
