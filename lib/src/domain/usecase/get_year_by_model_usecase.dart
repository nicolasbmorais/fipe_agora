import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetYearByModelUsecase
    extends Usecase<List<YearByModelEntity>, GetYearByModelParams> {
  final FipeRepositoryInterface repository;

  GetYearByModelUsecase({required this.repository});

  @override
  Future<List<YearByModelEntity>> call(GetYearByModelParams params) async {
    try {
      return await repository.getYearByModel(
        tableCode: params.tableCode,
        vehicleCode: params.vehicleCode,
        brandCode: params.brandCode,
        modelCode: params.modelCode,
      );
    } on Exception catch (e) {
      throw YearByModelFailure(message: e.toString());
    }
  }
}

class GetYearByModelParams extends Equatable {
  final String tableCode;
  final String vehicleCode;
  final String brandCode;
  final String modelCode;

  const GetYearByModelParams({
    required this.tableCode,
    required this.vehicleCode,
    required this.brandCode,
    required this.modelCode,
  });
  @override
  List<Object?> get props => [tableCode, vehicleCode, brandCode, modelCode];
}
