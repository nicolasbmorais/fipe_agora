import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';

class CarModel extends CarModelsEntity {
  const CarModel({
    required super.label,
    required super.value,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        label: json["Label"],
        value: json["Value"],
      );
}
