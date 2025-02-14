import 'package:fipe_agora/src/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  const BrandModel({
    required super.label,
    required super.value,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        label: json["Label"] ?? '',
        value: json["Value"] ?? '',
      );
}
