import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetFipeTableUsecase extends Usecase<FipeTableEntity, GetFipeParams> {
  final FipeRepositoryInterface repository;

  GetFipeTableUsecase({required this.repository});
  @override
  Future<FipeTableEntity> call(GetFipeParams params) async {
    try {
      return await repository.getFipeTable(
        tableCode: params.tableCode,
        vehicleCode: params.vehicleCode,
        brandCode: params.brandCode,
        modelCode: params.modelCode,
        yearId: params.yearId,
      );
    } on Exception catch (e) {
      throw FipeTableFailure(message: e.toString());
    }
  }
}

class GetFipeParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;
  final String yearId;
  final String modelCode;

  const GetFipeParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
    required this.yearId,
    required this.modelCode,
  });

  @override
  List<Object?> get props => [
        tableCode,
        vehicleCode,
        brandCode,
        yearId,
        modelCode,
      ];
}
