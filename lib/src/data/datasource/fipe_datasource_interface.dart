import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/fipe_table_model.dart';
import 'package:fipe_agora/src/data/models/model_by_year_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/data/models/vehicle_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';

abstract class FipeDatasourceInterface {
  Future<List<ReferenceTableModel>> getReferenceTable();
  Future<List<BrandModel>> getBrands({
    required String tableCode,
    required String vehicleCode,
  });
  Future<VehicleModels> getVehicleModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  });
  Future<List<YearModel>> getYearModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  });
  Future<List<ModelByYearModel>> getModelByYear({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String year,
    required String fuelCode,
    required String yearModel,
  });
  Future<FipeTableModel> getFipeTable({
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
