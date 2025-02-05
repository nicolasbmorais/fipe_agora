import 'package:dio/dio.dart';
import 'package:fipe_agora/environment.dart';
import 'package:fipe_agora/src/domain/services/dio_client_interface.dart';

class DioClient implements DioClientInterface {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.baseURL,
        headers: {
          'x-rapidapi-key': Environment.apiKey,
          'x-rapidapi-host': 'fipe2.p.rapidapi.com',
          'Content-Type': 'application/json',
          'accept-encoding': 'gzip',
        },
      ),
    );
  }

  @override
  Dio get dio => _dio;
}
