import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/exceptions/fipe_exceptions.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class FipeRepositoryImpl implements FipeRepositoryInterface {
  final FipeDatasourceInterface fipeDataSource;

  FipeRepositoryImpl({required this.fipeDataSource});
  @override
  Future<List<ReferenceTableEntity>> getReferenceTable() async {
    try {
      return await fipeDataSource.getReferenceTable();
    } on ReferenceTableException catch (e) {
      throw Exception(e);
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
    } on BrandsException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<VehicleModelsEntity> getVehicleModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  }) async {
    try {
      return await fipeDataSource.getVehicleModels(
        tableCode: tableCode,
        vehicleCode: vehicleCode,
        brandCode: brandCode,
      );
    } on VehicleModelsException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<List<YearModelEntity>> getYearModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  }) async {
    try {
      return await fipeDataSource.getYearModel(
        tableCode: tableCode,
        vehicleCode: vehicleCode,
        brandCode: brandCode,
        modelCode: modelCode,
      );
    } on YearModelException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<ModelByYearEntity>> getModelByYear({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String year,
    required String fuelCode,
    required String yearModel,
  }) async {
    try {
      return await fipeDataSource.getModelByYear(
        tableCode: tableCode,
        vehicleCode: vehicleCode,
        brandCode: brandCode,
        year: year,
        fuelCode: fuelCode,
        yearModel: yearModel,
      );
    } on ReferenceTableException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<FipeTableEntity> getFipeTable({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String year,
    required String fuelCode,
    required String yearModel,
    required String modelCode,
    required String consultType,
  }) async {
    try {
      return await fipeDataSource.getFipeTable(
        tableCode: tableCode,
        modelCode: modelCode,
        consultType: consultType,
        vehicleCode: vehicleCode,
        brandCode: brandCode,
        year: year,
        fuelCode: fuelCode,
        yearModel: yearModel,
      );
    } on FipeTableException catch (e) {
      throw Exception(e);
    }
  }
}
