import 'package:dio/dio.dart';
import 'package:fipe_agora/environment.dart';
import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/car_models_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';

class FipeDatasourceImpl implements FipeDatasourceInterface {
  final Dio dio;

  FipeDatasourceImpl({required this.dio});

  @override
  Future<List<ReferenceTableModel>> getReferenceTable() async {
    Response<dynamic> response;
    try {
      response = await dio.get(
        '${Environment.baseURL}ConsultarTabelaDeReferencia',
      );
    } catch (e) {
      throw ApiFailure();
    }
    final respData = response.data;

    if (response.statusCode != 200) {
      throw ApiFailure();
    }

    return respData is List
        ? List<ReferenceTableModel>.from(
            respData.map((e) => ReferenceTableModel.fromJson(e)))
        : [];
  }

  @override
  Future<List<BrandModel>> getBrands({
    required String tableCode,
    required String vehicleCode,
  }) async {
    try {
      final response = await dio.get('${Environment.baseURL}ConsultarMarcas');

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
  Future<List<CarModelsModel>> getCarModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
    required String modelCode,
  }) async {
    try {
      final response = await dio.get('${Environment.baseURL}ConsultarModelos');

      return response.data is List
          ? List<CarModelsModel>.from(
              response.data.map((item) => CarModelsModel.fromJson(item)))
          : <CarModelsModel>[];
    } on DioException catch (_) {
      throw BrandsFailure();
    } catch (err) {
      throw BrandsFailure(error: err.toString());
    }
  }
}
