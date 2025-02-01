import 'package:fipe_agora/src/data/datasource/fipe_datasource_impl.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/repository/fipe_repository_impl.dart';
import 'package:fipe_agora/src/data/services/dio_connectivity_client.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/services/dio_client_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_reference_table_usecase.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector() async {
  // Externals
  getIt.registerSingleton<DioClientInterface>(DioClient());

  // Datasources
  getIt.registerLazySingleton<FipeDatasourceInterface>(
    () => FipeDatasourceImpl(dio: getIt()),
  );

  // Repositorys
  getIt.registerLazySingleton<FipeRepositoryInterface>(
    () => FipeRepositoryImpl(fipeDataSource: getIt()),
  );

  // UseCases
  getIt.registerLazySingleton<GetReferenceTableUsecase>(
    () => GetReferenceTableUsecase(repository: getIt()),
  );

  // Controllers
  getIt.registerSingleton<FipeController>(FipeController());
}
