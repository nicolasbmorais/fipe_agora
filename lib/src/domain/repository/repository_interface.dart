import 'package:fipe_agora/src/domain/entities/reference_table.dart';

abstract class FipeRepositoryInterface {
  Future<List<ReferenceTableEntity>> getReferenceTable();
}
