import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';

class CarModelsModel extends CarModelsEntity {
  const CarModelsModel({
    required super.label,
    required super.value,
  });

  factory CarModelsModel.fromJson(Map<String, dynamic> json) => CarModelsModel(
        label: json["Label"],
        value: json["Value"],
      );
}
