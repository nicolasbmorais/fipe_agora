import 'package:dio/dio.dart';
import 'package:fipe_agora/environment.dart';
import 'package:fipe_agora/src/domain/services/dio_client_interface.dart';

class DioClient implements DioClientInterface {
  late final Dio _dio;
  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.baseURL,
        contentType: 'application/json',
      ),
    );
  }

  @override
  Dio get dio => _dio;
}
