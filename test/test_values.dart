import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/domain/entities/reference_table.dart';

List<ReferenceTableEntity> listReferenceTable() => [
      const ReferenceTableEntity(codigo: 317, mes: 'janeiro/2025'),
      const ReferenceTableEntity(codigo: 316, mes: 'dezembro/2025'),
    ];

Failure noConnection() => NoConnection();
