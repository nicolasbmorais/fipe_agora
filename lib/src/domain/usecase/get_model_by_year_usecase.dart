import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetModelByYearUsecase
    extends Usecase<List<ModelByYearEntity>, GetrModelByYearParams> {
  final FipeRepositoryInterface repository;

  GetModelByYearUsecase({required this.repository});
  @override
  Future<List<ModelByYearEntity>> call(GetrModelByYearParams params) async {
    return await repository.getModelByYear(
      tableCode: params.tableCode,
      vehicleCode: params.vehicleCode,
      brandCode: params.brandCode,
      year: params.year,
      fuelCode: params.fuelCode,
      yearModel: params.yearModel,
    );
  }
}

class GetrModelByYearParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;
  final String year;
  final String fuelCode;
  final String yearModel;

  const GetrModelByYearParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
    required this.year,
    required this.fuelCode,
    required this.yearModel,
  });

  @override
  List<Object?> get props => [
        tableCode,
        vehicleCode,
        brandCode,
        year,
        fuelCode,
        yearModel,
      ];
}
