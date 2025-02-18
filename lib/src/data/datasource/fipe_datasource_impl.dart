import 'package:dio/dio.dart';
import 'package:fipe_agora/environment.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/exceptions/fipe_exceptions.dart';
import 'package:fipe_agora/src/data/models/models.dart';

class FipeDatasourceImpl implements FipeDatasourceInterface {
  final Dio dio;

  FipeDatasourceImpl({required this.dio});

  @override
  Future<List<ReferenceTableModel>> getReferenceTable() async {
    try {
      final response = await dio.get('references');

      if (response.statusCode != 200 || response.data == null) {
        throw ReferenceTableException();
      }

      final respData = response.data;

      return respData is List
          ? List<ReferenceTableModel>.from(
              respData.map((e) => ReferenceTableModel.fromJson(e)),
            )
          : [];
    } on DioException catch (error) {
      throw ReferenceTableException(
        message: error.response?.data['error'],
      );
    } catch (err) {
      throw ReferenceTableException();
    }
  }

  @override
  Future<List<BrandModel>> getBrands({
    required String tableCode,
    required String vehicleCode,
  }) async {
    try {
      final response = await dio.get(
          '${Environment.baseURL}$vehicleCode/brands',
          queryParameters: {"reference": tableCode});

      if (response.statusCode != 200 || response.data == null) {
        throw BrandsException();
      }

      return response.data is List
          ? List<BrandModel>.from(
              response.data.map((item) => BrandModel.fromJson(item)))
          : <BrandModel>[];
    } on DioException catch (error) {
      throw BrandsException(
        message: error.response?.data['error'],
      );
    } catch (err) {
      throw BrandsException(message: err.toString());
    }
  }

  @override
  Future<List<VehicleModels>> getVehicleModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  }) async {
    try {
      final response = await dio.get(
        '${Environment.baseURL}$vehicleCode/brands/$brandCode/models',
        queryParameters: {'reference': tableCode},
      );

      if (response.statusCode != 200 || response.data == null) {
        throw VehicleModelsException();
      }

      return response.data is List
          ? List<VehicleModels>.from(
              response.data.map((item) => VehicleModels.fromJson(item)))
          : <VehicleModels>[];
    } on DioException catch (error) {
      throw VehicleModelsException(
        message: error.response?.data['error'],
      );
    } catch (err) {
      throw VehicleModelsException(message: err.toString());
    }
  }

  @override
  Future<List<YearByModel>> getYearByModel({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  }) async {
    try {
      final response = await dio.get(
          '${Environment.baseURL}$vehicleCode/brands/$brandCode/models/$modelCode/years',
          queryParameters: {"reference": tableCode});

      if (response.statusCode != 200 || response.data == null) {
        throw YearByModelException();
      }

      return response.data is List
          ? List<YearByModel>.from(
              response.data.map((item) => YearByModel.fromJson(item)))
          : <YearByModel>[];
    } on DioException catch (error) {
      throw YearByModelException(
        message: error.response?.data['error'],
      );
    } catch (err) {
      throw YearByModelException(message: err.toString());
    }
  }

  @override
  Future<FipeTableModel> getFipeTable({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String yearId,
    required String modelCode,
  }) async {
    try {
      final response = await dio.get(
          '${Environment.baseURL}$vehicleCode/brands/$brandCode/models/$modelCode/years/$yearId',
          queryParameters: {"reference": tableCode});

      if (response.statusCode != 200 || response.data == null) {
        throw FipeTableException();
      }

      return FipeTableModel.fromJson(response.data);
    } on DioException catch (error) {
      throw FipeTableException(
        message: error.response?.data['error'],
      );
    } catch (err) {
      throw FipeTableException(message: err.toString());
    }
  }
}
