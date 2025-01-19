import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/reference_table.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetReferenceTableUsecase
    extends Usecase<List<ReferenceTableEntity>, NoParams> {
  final FipeRepositoryInterface repositoryInterface;

  GetReferenceTableUsecase({required this.repositoryInterface});

  @override
  Future<List<ReferenceTableEntity>> call(NoParams params) async {
    return await repositoryInterface.getReferenceTable();
  }
}
