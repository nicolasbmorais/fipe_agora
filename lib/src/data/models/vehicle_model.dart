import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';

class VehicleModels extends VehicleModelsEntity {
  const VehicleModels({required super.code, required super.name});

  factory VehicleModels.fromJson(Map<String, dynamic> json) => VehicleModels(
        code: json["code"] ?? '',
        name: json["name"] ?? '',
      );
}
