import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/fipe_table_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/data/models/vehicle_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';

abstract class FipeDatasourceInterface {
  Future<List<ReferenceTableModel>> getReferenceTable();
  Future<List<BrandModel>> getBrands({
    required String tableCode,
    required String vehicleCode,
  });
  Future<List<VehicleModels>> getVehicleModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  });
  Future<List<YearByModel>> getYearByModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  });
  Future<FipeTableModel> getFipeTable({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String yearId,
    required String modelCode,
  });
}
