import 'package:fipe_agora/src/data/models/reference_table_model.dart';

abstract class FipeDatasourceInterface {
  Future<List<ReferenceTableModel>> getReferenceTable();
}
