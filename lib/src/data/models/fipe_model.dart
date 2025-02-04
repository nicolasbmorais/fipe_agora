import 'package:fipe_agora/src/domain/entities/fipe_model.dart';

class FipeModel extends FipeModelEntity {
  FipeModel({
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

  factory FipeModel.fromJson(Map<String, dynamic> json) => FipeModel(
        value: json["Valor"],
        brand: json["Marca"],
        model: json["Modelo"],
        modelYear: json["AnoModelo"],
        fuel: json["Combustivel"],
        fipeCode: json["CodigoFipe"],
        referenceMonth: json["MesReferencia"],
        authentication: json["Autenticacao"],
        vehicleType: json["TipoVeiculo"],
        fuelAcronym: json["SiglaCombustivel"],
        consultationDate: json["DataConsulta"],
      );
}
