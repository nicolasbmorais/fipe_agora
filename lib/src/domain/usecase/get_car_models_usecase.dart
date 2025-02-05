import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetVehicleModelsUsecase
    extends Usecase<VehicleModelsEntity, GetVehicleModelsParams> {
  final FipeRepositoryInterface repository;

  GetVehicleModelsUsecase({required this.repository});
  @override
  Future<VehicleModelsEntity> call(GetVehicleModelsParams params) async {
    return await repository.getVehicleModels(
      tableCode: params.tableCode,
      vehicleCode: params.vehicleCode,
      brandCode: params.brandCode,
    );
  }
}

class GetVehicleModelsParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;

  const GetVehicleModelsParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
  });
  @override
  List<Object?> get props => [tableCode, vehicleCode, brandCode];
}
