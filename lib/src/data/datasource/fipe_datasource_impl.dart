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
      final response = await dio.post('ConsultarTabelaDeReferencia');

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
        message: error.response?.data["data"][0]['message'],
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
      final response = await dio.post(
        '${Environment.baseURL}ConsultarMarcas',
        data: {
          "codigoTabelaReferencia": tableCode,
          "codigoTipoVeiculo": vehicleCode,
        },
      );

      if (response.statusCode != 200 || response.data == null) {
        throw BrandsException();
      }

      return response.data is List
          ? List<BrandModel>.from(
              response.data.map((item) => BrandModel.fromJson(item)))
          : <BrandModel>[];
    } on DioException catch (error) {
      throw BrandsException(
        message: error.response?.data["data"][0]['message'],
      );
    } catch (err) {
      throw BrandsException(message: err.toString());
    }
  }

  @override
  Future<VehicleModels> getVehicleModels({
    required String tableCode,
    required String vehicleCode,
    required String brandCode,
  }) async {
    try {
      final response =
          await dio.post('${Environment.baseURL}ConsultarModelos', data: {
        "codigoTabelaReferencia": tableCode,
        "codigoTipoVeiculo": vehicleCode,
        "codigoMarca": brandCode,
      });

      if (response.statusCode != 200 || response.data == null) {
        throw VehicleModelsException();
      }

      return VehicleModels.fromJson(response.data);
    } on DioException catch (_) {
      throw VehicleModelsException();
    } catch (err) {
      throw VehicleModelsException(message: err.toString());
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
          await dio.post('${Environment.baseURL}ConsultarAnoModelo', data: {
        "codigoTabelaReferencia": tableCode,
        "codigoTipoVeiculo": vehicleCode,
        "codigoMarca": brandCode,
        "codigoModelo": modelCode,
      });

      if (response.statusCode != 200 || response.data == null) {
        throw YearModelException();
      }

      return response.data is List
          ? List<YearModel>.from(
              response.data.map((item) => YearModel.fromJson(item)))
          : <YearModel>[];
    } on DioException catch (_) {
      throw YearModelException();
    } catch (err) {
      throw YearModelException(message: err.toString());
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
          await dio.post('${Environment.baseURL}ConsultarModelosAtravesDoAno');

      if (response.statusCode != 200 || response.data == null) {
        throw ModelByYearException();
      }

      return response.data is List
          ? List<ModelByYearModel>.from(
              response.data.map((item) => ModelByYearModel.fromJson(item)))
          : <ModelByYearModel>[];
    } on DioException catch (_) {
      throw ModelByYearException();
    } catch (err) {
      throw ModelByYearException(message: err.toString());
    }
  }

  @override
  Future<FipeTableModel> getFipeTable({
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
      final response = await dio.post(
          '${Environment.baseURL}ConsultarValorComTodosParametros',
          data: {
            "codigoTabelaReferencia": tableCode,
            "codigoTipoVeiculo": vehicleCode,
            "codigoMarca": brandCode,
            "ano": year,
            "codigoTipoCombustivel": fuelCode,
            "anoModelo": yearModel,
            "codigoModelo": modelCode,
            "tipoConsulta": consultType,
          });

      if (response.statusCode != 200 || response.data == null) {
        throw FipeTableException();
      }

      return FipeTableModel.fromJson(response.data);
    } on DioException catch (_) {
      throw FipeTableException();
    } catch (err) {
      throw FipeTableException(message: err.toString());
    }
  }
}
