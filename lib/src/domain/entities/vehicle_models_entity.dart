import 'package:equatable/equatable.dart';

class VehicleModelsEntity extends Equatable {
  final String name;
  final String code;

  const VehicleModelsEntity({
    required this.name,
    required this.code,
  });

  factory VehicleModelsEntity.empty() => const VehicleModelsEntity(
        name: '',
        code: '0',
      );

  @override
  List<Object?> get props => [name, code];
}
