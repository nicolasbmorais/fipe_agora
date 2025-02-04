import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/fipe_model.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetFipeTableUsecase extends Usecase<FipeModelEntity, GetFipeParams> {
  final FipeRepositoryInterface repository;

  GetFipeTableUsecase({required this.repository});
  @override
  Future<FipeModelEntity> call(GetFipeParams params) async {
    return await repository.getFipeTable(
      tableCode: params.tableCode,
      vehicleCode: params.vehicleCode,
      brandCode: params.brandCode,
      year: params.year,
      fuelCode: params.fuelCode,
      yearModel: params.yearModel,
      modelCode: params.modelCode,
      consultType: params.consultType,
    );
  }
}

class GetFipeParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;
  final String year;
  final String fuelCode;
  final String yearModel;
  final String modelCode;
  final String consultType;

  const GetFipeParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
    required this.year,
    required this.fuelCode,
    required this.yearModel,
    required this.modelCode,
    required this.consultType,
  });

  @override
  List<Object?> get props => [
        tableCode,
        vehicleCode,
        brandCode,
        year,
        fuelCode,
        yearModel,
        modelCode,
        consultType,
      ];
}
