import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';

class ReferenceTableModel extends ReferenceTableEntity {
  const ReferenceTableModel({
    required super.code,
    required super.month,
  });

  factory ReferenceTableModel.fromJson(Map<String, dynamic> json) =>
      ReferenceTableModel(
        code: json["code"] ?? "",
        month: json["month"] ?? "",
      );
}
