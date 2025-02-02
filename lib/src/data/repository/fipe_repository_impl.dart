import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
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

  @override
  Future<List<BrandEntity>> getBrands({
    required String tableCode,
    required String vehicleCode,
  }) async {
    try {
      return await fipeDataSource.getBrands(
        tableCode: tableCode,
        vehicleCode: vehicleCode,
      );
    } on Failure catch (_) {
      throw ApiFailure();
    }
  }

  @override
  Future<List<CarModelsEntity>> getCarModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  }) async {
    try {
      return await fipeDataSource.getCarModels(
        tableCode: tableCode,
        vehicleCode: vehicleCode,
        brandCode: brandCode,
        modelCode: modelCode,
      );
    } on Failure catch (_) {
      throw ApiFailure();
    }
  }
}
