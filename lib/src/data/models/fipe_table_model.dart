import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';

class FipeTableModel extends FipeTableEntity {
  const FipeTableModel({
    required super.value,
    required super.brand,
    required super.model,
    required super.modelYear,
    required super.fuel,
    required super.fipeCode,
    required super.referenceMonth,
    required super.authentication,
    required super.vehicleType,
    required super.fuelAcronym,
    required super.consultationDate,
  });

  factory FipeTableModel.fromJson(Map<String, dynamic> json) => FipeTableModel(
        value: json["Valor"] ?? '',
        brand: json["Marca"] ?? '',
        model: json["Modelo"] ?? '',
        modelYear: json["AnoModelo"] ?? 0,
        fuel: json["Combustivel"] ?? '',
        fipeCode: json["CodigoFipe"] ?? '',
        referenceMonth: json["MesReferencia"] ?? '',
        authentication: json["Autenticacao"] ?? '',
        vehicleType: json["TipoVeiculo"] ?? 0,
        fuelAcronym: json["SiglaCombustivel"] ?? '',
        consultationDate: json["DataConsulta"] ?? '',
      );
}
