import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';

class VehicleModels extends VehicleModelsEntity {
  const VehicleModels({required super.model, required super.year});

  factory VehicleModels.fromJson(Map<String, dynamic> json) => VehicleModels(
        model: json["Modelos"] != null
            ? List<Model>.from(json["Modelos"].map((x) => Model.fromJson(x)))
            : [],
        year: json["Anos"] != null
            ? List<Year>.from(json["Anos"].map((x) => Year.fromJson(x)))
            : [],
      );
}

class Model extends ModelEntity {
  const Model({
    required super.label,
    required super.value,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        label: json["Label"] ?? '',
        value: json["Value"] ?? 0,
      );
}

class Year extends YearEntity {
  const Year({required super.label, required super.value});

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        label: json["Label"] ?? '',
        value: json["Value"] ?? '',
      );
}
