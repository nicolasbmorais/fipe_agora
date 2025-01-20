import 'package:fipe_agora/src/data/datasource/fipe_datasource_impl.dart';
import 'package:fipe_agora/src/data/repository/fipe_repository_impl.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/services/dio_client_interface.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static final _instance = GetIt.instance;
  static GetIt get instance => _instance;

  static void setup() {
    final dioClient = _instance.get<DioClientInterface>();
    final fipeDataSourceImpl = FipeDatasourceImpl(dio: dioClient.dio);

    _instance.registerLazySingleton<FipeRepositoryInterface>(
      () => FipeRepositoryImpl(fipeDataSource: fipeDataSourceImpl),
    );

    _instance.registerSingleton<FipeController>(FipeController());
    // _instance.registerSingleton<GetReferenceTableUsecase>(
    //     GetReferenceTableUsecase(repositoryInterface: _instance));
  }
}
