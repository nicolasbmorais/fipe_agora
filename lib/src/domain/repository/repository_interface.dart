import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_model.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

abstract class FipeRepositoryInterface {
  Future<List<ReferenceTableEntity>> getReferenceTable();
  Future<List<BrandEntity>> getBrands({
    required String tableCode,
    required String vehicleCode,
  });
  Future<List<CarModelsEntity>> getCarModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  });
  Future<List<YearModelEntity>> getYearModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  });
  Future<List<ModelByYearEntity>> getModelByYear({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String year,
    required String fuelCode,
    required String yearModel,
  });
  Future<FipeModelEntity> getFipeTable({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String year,
    required String fuelCode,
    required String yearModel,
    required String modelCode,
    required String consultType,
  });
}
