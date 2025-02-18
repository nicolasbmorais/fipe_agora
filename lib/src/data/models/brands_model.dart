import 'package:fipe_agora/src/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.name,
    required super.code,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        name: json["name"] ?? '',
        code: json["code"] ?? '',
      );
}
