import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';

class FipeTableModel extends FipeTableEntity {
  const FipeTableModel({
    required super.brand,
    required super.codeFipe,
    required super.fuel,
    required super.fuelAcronym,
    required super.model,
    required super.modelYear,
    required super.price,
    required super.priceHistory,
    required super.referenceMonth,
    required super.vehicleType,
  });

  factory FipeTableModel.fromJson(Map<String, dynamic> json) => FipeTableModel(
        brand: json["brand"] ?? '',
        codeFipe: json["codeFipe"] ?? '',
        fuel: json["fuel"] ?? '',
        fuelAcronym: json["fuelAcronym"] ?? '',
        model: json["model"] ?? '',
        modelYear: json["modelYear"] ?? 0,
        price: json["price"] ?? '',
        priceHistory: json["priceHistory"] != null
            ? List<PriceHistory>.from(
                json["priceHistory"].map((x) => PriceHistory.fromJson(x)))
            : [],
        referenceMonth: json["referenceMonth"] ?? '',
        vehicleType: json["vehicleType"] ?? 0,
      );
}

class PriceHistory extends PriceHistoryEntity {
  const PriceHistory({
    required super.month,
    required super.price,
    required super.reference,
  });

  factory PriceHistory.fromJson(Map<String, dynamic> json) => PriceHistory(
        month: json["month"],
        price: json["price"],
        reference: json["reference"],
      );
}
