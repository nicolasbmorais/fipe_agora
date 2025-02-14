import 'package:equatable/equatable.dart';

class FipeTableEntity extends Equatable {
  final String value;
  final String brand;
  final String model;
  final int modelYear;
  final String fuel;
  final String fipeCode;
  final String referenceMonth;
  final String authentication;
  final int vehicleType;
  final String fuelAcronym;
  final String consultationDate;

  const FipeTableEntity({
    required this.value,
    required this.brand,
    required this.model,
    required this.modelYear,
    required this.fuel,
    required this.fipeCode,
    required this.referenceMonth,
    required this.authentication,
    required this.vehicleType,
    required this.fuelAcronym,
    required this.consultationDate,
  });

  factory FipeTableEntity.empty() => const FipeTableEntity(
        value: '',
        brand: '',
        model: '',
        modelYear: 0,
        fuel: '',
        fipeCode: '',
        referenceMonth: '',
        authentication: '',
        vehicleType: 0,
        fuelAcronym: '',
        consultationDate: '',
      );

  bool get isEmpty =>
      value.isEmpty &&
      brand.isEmpty &&
      model.isEmpty &&
      modelYear == 0 &&
      fuel.isEmpty &&
      fipeCode.isEmpty &&
      referenceMonth.isEmpty &&
      authentication.isEmpty &&
      vehicleType == 0 &&
      fuelAcronym.isEmpty &&
      consultationDate.isEmpty;

  @override
  List<Object?> get props => [
        value,
        brand,
        model,
        modelYear,
        fuel,
        fipeCode,
        referenceMonth,
        authentication,
        vehicleType,
        fuelAcronym,
        consultationDate,
      ];
}
