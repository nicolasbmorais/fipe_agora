import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetCarModelsUsecase
    extends Usecase<List<CarModelsEntity>, GetCarModelsParams> {
  final FipeRepositoryInterface fipeRepository;

  GetCarModelsUsecase({required this.fipeRepository});
  @override
  Future<List<CarModelsEntity>> call(GetCarModelsParams params) async {
    return await fipeRepository.getCarModels(
      tableCode: params.tableCode,
      vehicleCode: params.vehicleCode,
      brandCode: params.brandCode,
      modelCode: params.modelCode,
    );
  }
}

class GetCarModelsParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;
  final String modelCode;

  const GetCarModelsParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
    required this.modelCode,
  });
  @override
  List<Object?> get props => [tableCode, vehicleCode, brandCode, modelCode];
}
