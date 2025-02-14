import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetReferenceTableUsecase
    extends Usecase<List<ReferenceTableEntity>, NoParams> {
  final FipeRepositoryInterface repository;

  GetReferenceTableUsecase({required this.repository});

  @override
  Future<List<ReferenceTableEntity>> call(NoParams params) async {
    try {
      return await repository.getReferenceTable();
    } on Exception catch (e) {
      throw ReferenceTableFailure(message: e.toString());
    }
  }
}
