import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/car_models_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';

abstract class FipeDatasourceInterface {
  Future<List<ReferenceTableModel>> getReferenceTable();
  Future<List<BrandModel>> getBrands({
    required String tableCode,
    required String vehicleCode,
  });
  Future<List<CarModelsModel>> getCarModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  });
}
