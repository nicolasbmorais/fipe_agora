import 'package:equatable/equatable.dart';

class VehicleModelsEntity extends Equatable {
  final List<ModelEntity> model;
  final List<YearEntity> year;

  const VehicleModelsEntity({
    required this.model,
    required this.year,
  });

  factory VehicleModelsEntity.empty() => const VehicleModelsEntity(
        model: [],
        year: [],
      );

  @override
  List<Object?> get props => [model, year];
}

class YearEntity extends Equatable {
  final String label;
  final String value;

  const YearEntity({
    required this.label,
    required this.value,
  });

  factory YearEntity.empty() => const YearEntity(
        label: '',
        value: '',
      );

  @override
  List<Object?> get props => [label, value];
}

class ModelEntity extends Equatable {
  final String label;
  final int value;

  const ModelEntity({
    required this.label,
    required this.value,
  });
  factory ModelEntity.empty() => const ModelEntity(
        label: '',
        value: 0,
      );

  @override
  List<Object?> get props => [label, value];
}
