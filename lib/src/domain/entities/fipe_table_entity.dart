import 'package:equatable/equatable.dart';

class FipeTableEntity extends Equatable {
  final String brand;
  final String codeFipe;
  final String fuel;
  final String fuelAcronym;
  final String model;
  final int modelYear;
  final String price;
  final List<PriceHistoryEntity> priceHistory;
  final String referenceMonth;
  final int vehicleType;

  const FipeTableEntity({
    required this.brand,
    required this.codeFipe,
    required this.fuel,
    required this.fuelAcronym,
    required this.model,
    required this.modelYear,
    required this.price,
    required this.priceHistory,
    required this.referenceMonth,
    required this.vehicleType,
  });

  factory FipeTableEntity.empty() => FipeTableEntity(
        brand: '',
        codeFipe: '',
        fuel: '',
        fuelAcronym: '',
        model: '',
        modelYear: 0,
        price: '',
        priceHistory: [],
        referenceMonth: '',
        vehicleType: 0,
      );

  bool get isEmpty =>
      price.isEmpty &&
      brand.isEmpty &&
      model.isEmpty &&
      modelYear == 0 &&
      fuel.isEmpty &&
      codeFipe.isEmpty &&
      referenceMonth.isEmpty &&
      vehicleType == 0 &&
      fuelAcronym.isEmpty;

  @override
  List<Object?> get props => [
        brand,
        codeFipe,
        fuel,
        fuelAcronym,
        model,
        modelYear,
        price,
        priceHistory,
        referenceMonth,
        vehicleType,
      ];
}

class PriceHistoryEntity extends Equatable {
  final String month;
  final String price;
  final String reference;

  const PriceHistoryEntity({
    required this.month,
    required this.price,
    required this.reference,
  });

  factory PriceHistoryEntity.empty() => PriceHistoryEntity(
        month: '',
        price: '',
        reference: '',
      );

  @override
  List<Object?> get props => [
        month,
        price,
        reference,
      ];
}
