import 'package:dio/dio.dart';
import 'package:fipe_agora/environment.dart';
import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
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
}
