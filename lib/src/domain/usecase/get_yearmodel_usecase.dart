import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetYearModelUsecase
    extends Usecase<List<YearModelEntity>, GetYearModelParams> {
  final FipeRepositoryInterface repository;

  GetYearModelUsecase({required this.repository});

  @override
  Future<List<YearModelEntity>> call(GetYearModelParams params) async {
    try {
      return await repository.getYearModel(
        tableCode: params.tableCode,
        vehicleCode: params.vehicleCode,
        brandCode: params.brandCode,
        modelCode: params.modelCode,
      );
    } on Exception catch (e) {
      throw YearModelFailure(message: e.toString());
    }
  }
}

class GetYearModelParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;
  final String modelCode;

  const GetYearModelParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
    required this.modelCode,
  });
  @override
  List<Object?> get props => [tableCode, vehicleCode, brandCode, modelCode];
}
