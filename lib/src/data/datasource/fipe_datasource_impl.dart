import 'package:dio/dio.dart';
import 'package:fipe_agora/environment.dart';
import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/car_model.dart';
import 'package:fipe_agora/src/data/models/fipe_model.dart';
import 'package:fipe_agora/src/data/models/model_by_year_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';

class FipeDatasourceImpl implements FipeDatasourceInterface {
  final Dio dio;

  FipeDatasourceImpl({required this.dio});

  @override
  Future<List<ReferenceTableModel>> getReferenceTable() async {
    try {
      final response = await dio.get(
        '${Environment.baseURL}ConsultarTabelaDeReferencia',
      );

      if (response.statusCode != 200 || response.data == null) {
        throw ApiFailure();
      }

      final respData = response.data;

      return respData is List
          ? List<ReferenceTableModel>.from(
              respData.map((e) => ReferenceTableModel.fromJson(e)),
            )
          : [];
    } on DioException catch (_) {
      throw ApiFailure();
    } catch (err) {
      throw ApiFailure();
    }
  }

  @override
  Future<List<BrandModel>> getBrands({
    required String tableCode,
    required String vehicleCode,
  }) async {
    try {
      final response = await dio.get('${Environment.baseURL}ConsultarMarcas');

      if (response.statusCode != 200 || response.data == null) {
        throw BrandsFailure();
      }

      return response.data is List
          ? List<BrandModel>.from(
              response.data.map((item) => BrandModel.fromJson(item)))
          : <BrandModel>[];
    } on DioException catch (_) {
      throw BrandsFailure();
    } catch (err) {
      throw BrandsFailure(error: err.toString());
    }
  }

  @override
  Future<List<CarModel>> getCarModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  }) async {
    try {
      final response = await dio.get('${Environment.baseURL}ConsultarModelos');

      if (response.statusCode != 200 || response.data == null) {
        throw BrandsFailure();
      }

      return response.data is List
          ? List<CarModel>.from(
              response.data.map((item) => CarModel.fromJson(item)))
          : <CarModel>[];
    } on DioException catch (_) {
      throw BrandsFailure();
    } catch (err) {
      throw CarModelFailure(error: err.toString());
    }
  }

  @override
  Future<List<YearModel>> getYearModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  }) async {
    try {
      final response =
          await dio.get('${Environment.baseURL}ConsultarAnoModelo');

      if (response.statusCode != 200 || response.data == null) {
        throw YearModelFailure();
      }

      return response.data is List
          ? List<YearModel>.from(
              response.data.map((item) => YearModel.fromJson(item)))
          : <YearModel>[];
    } on DioException catch (_) {
      throw YearModelFailure();
    } catch (err) {
      throw YearModelFailure(error: err.toString());
    }
  }

  @override
  Future<List<ModelByYearModel>> getModelByYear({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String year,
    required String fuelCode,
    required String yearModel,
  }) async {
    try {
      final response =
          await dio.get('${Environment.baseURL}ConsultarModelosAtravesDoAno');

      if (response.statusCode != 200 || response.data == null) {
        throw ModelByYearFailure();
      }

      return response.data is List
          ? List<ModelByYearModel>.from(
              response.data.map((item) => ModelByYearModel.fromJson(item)))
          : <ModelByYearModel>[];
    } on DioException catch (_) {
      throw ModelByYearFailure();
    } catch (err) {
      throw ModelByYearFailure(error: err.toString());
    }
  }

  @override
  Future<FipeModel> getFipeTable({
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
      final response = await dio
          .get('${Environment.baseURL}ConsultarValorComTodosParametros');

      if (response.statusCode != 200 || response.data == null) {
        throw FipeFailure();
      }

      return FipeModel.fromJson(response.data);
    } on DioException catch (_) {
      throw FipeFailure();
    } catch (err) {
      throw FipeFailure(error: err.toString());
    }
  }
}
