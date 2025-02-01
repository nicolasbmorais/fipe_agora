import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';

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
    required String modelCode,
  });
}
