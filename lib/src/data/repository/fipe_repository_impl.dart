import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/domain/entities/reference_table.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class FipeRepositoryImpl implements FipeRepositoryInterface {
  final FipeDatasourceInterface fipeDataSource;

  FipeRepositoryImpl({required this.fipeDataSource});
  @override
  Future<List<ReferenceTableEntity>> getReferenceTable() async {
    try {
      return await fipeDataSource.getReferenceTable();
    } on Failure catch (_) {
      throw ApiFailure();
    }
  }
}
