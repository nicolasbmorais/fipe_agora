import 'package:dio/dio.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_impl.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/repository/fipe_repository_impl.dart';
import 'package:fipe_agora/src/data/services/dio_connectivity_client.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/services/dio_client_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_brands_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_vehicle_models_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_fipe_table_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_model_by_year_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_reference_table_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_yearmodel_usecase.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector() async {
  final dioClient = DioClient();
  getIt.registerLazySingleton<DioClientInterface>(() => dioClient);

  getIt.registerLazySingleton<Dio>(() => dioClient.dio);

  // Datasources
  getIt.registerLazySingleton<FipeDatasourceInterface>(
    () => FipeDatasourceImpl(dio: getIt.get<Dio>()),
  );

  // Repositorys
  getIt.registerLazySingleton<FipeRepositoryInterface>(
    () => FipeRepositoryImpl(
      fipeDataSource: getIt.get<FipeDatasourceInterface>(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton<GetReferenceTableUsecase>(
    () => GetReferenceTableUsecase(
        repository: getIt.get<FipeRepositoryInterface>()),
  );
  getIt.registerLazySingleton<GetBrandsUsecase>(
    () => GetBrandsUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetVehicleModelsUsecase>(
    () => GetVehicleModelsUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetYearModelUsecase>(
    () => GetYearModelUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetModelByYearUsecase>(
    () => GetModelByYearUsecase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetFipeTableUsecase>(
    () => GetFipeTableUsecase(repository: getIt()),
  );

  // Controllers
  getIt.registerLazySingleton<FipeController>(
    () => FipeController(
      getReferenceTableUsecase: getIt(),
      getBrandsUsecase: getIt(),
      getVehicleModelsUsecase: getIt(),
      getFipeTableUsecase: getIt(),
      getYearModelUsecase: getIt(),
      getModelByYearUsecase: getIt(),
    ),
  );
}
