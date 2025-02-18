import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

abstract class FipeRepositoryInterface {
  Future<List<ReferenceTableEntity>> getReferenceTable();
  Future<List<BrandEntity>> getBrands({
    required String tableCode,
    required String vehicleCode,
  });
  Future<List<VehicleModelsEntity>> getVehicleModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  });
  Future<List<YearByModelEntity>> getYearByModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  });
  Future<FipeTableEntity> getFipeTable({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String yearId,
    required String modelCode,
  });
}
