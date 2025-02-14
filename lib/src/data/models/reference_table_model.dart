import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';

class ReferenceTableModel extends ReferenceTableEntity {
  const ReferenceTableModel({
    required super.codigo,
    required super.mes,
  });

  factory ReferenceTableModel.fromJson(Map<String, dynamic> json) =>
      ReferenceTableModel(
        codigo: json["Codigo"] ?? 0,
        mes: json["Mes"] ?? "",
      );
}
