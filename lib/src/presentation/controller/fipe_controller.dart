import 'package:fipe_agora/src/core/base_controller.dart';
import 'package:fipe_agora/src/core/status.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/domain/usecase/usecase.dart';
import 'package:intl/intl.dart';

class VehicleType {
  final String name;
  final String vehicleType;

  const VehicleType({required this.name, required this.vehicleType});
}

class FipeController extends BaseController {
  final GetReferenceTableUsecase _getReferenceTableUsecase;
  final GetBrandsUsecase _getBrandsUsecase;
  final GetVehicleModelsUsecase _getVehicleModelsUsecase;
  final GetFipeTableUsecase _getFipeTableUsecase;
  final GetYearByModelUsecase _getYearByModelUsecase;

  FipeController({
    required GetReferenceTableUsecase getReferenceTableUsecase,
    required GetBrandsUsecase getBrandsUsecase,
    required GetVehicleModelsUsecase getVehicleModelsUsecase,
    required GetFipeTableUsecase getFipeTableUsecase,
    required GetYearByModelUsecase getYearByModelUsecase,
  })  : _getReferenceTableUsecase = getReferenceTableUsecase,
        _getBrandsUsecase = getBrandsUsecase,
        _getVehicleModelsUsecase = getVehicleModelsUsecase,
        _getFipeTableUsecase = getFipeTableUsecase,
        _getYearByModelUsecase = getYearByModelUsecase;

  final List<VehicleType> categories = [
    const VehicleType(name: 'Carros', vehicleType: 'cars'),
    const VehicleType(name: 'Motos', vehicleType: 'motorcycles'),
    const VehicleType(name: 'Caminhões', vehicleType: 'trucks'),
  ];

  VehicleType selectedCategory = const VehicleType(
    name: 'Carros',
    vehicleType: 'cars',
  );

  List<ReferenceTableEntity> referenceTableList = List.empty(growable: true);
  ReferenceTableEntity referenceTable = ReferenceTableEntity.empty();

  List<BrandEntity> brandList = List.empty(growable: true);
  BrandEntity brandEntity = BrandEntity.empty();

  List<VehicleModelsEntity> vehicleModel = List.empty(growable: true);
  VehicleModelsEntity vehicleModelsEntity = VehicleModelsEntity.empty();

  List<YearByModelEntity> yearIdList = List.empty(growable: true);
  YearByModelEntity yearIdEntity = YearByModelEntity.empty();

  FipeTableEntity fipeTable = FipeTableEntity.empty();

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  DateTime _consultDate = DateTime(0);

  reset() {
    brandEntity = BrandEntity.empty();
    yearIdEntity = YearByModelEntity.empty();
    fipeTable = FipeTableEntity.empty();
    notifyListeners();
  }

  void selectCategory(VehicleType value) {
    selectedCategory = value;
    notifyListeners();
  }

  Future<void> getReferenceTable() async {
    try {
      setStatus(Status.loading);

      referenceTableList.clear();
      referenceTableList
          .addAll(await _getReferenceTableUsecase.call(NoParams()));

      setStatus(Status.success);
    } on Exception catch (_) {
      setStatus(Status.error);
    }
  }

  Future<void> getBrand(ReferenceTableEntity item) async {
    referenceTable = item;
    setStatus(Status.loading);
    try {
      brandList.clear();
      brandList.addAll(await _getBrandsUsecase.call(
        GetBrandParams(
          tableCode: referenceTable.code,
          vehicleCode: selectedCategory.vehicleType,
        ),
      ));

      setStatus(Status.success);
    } on BrandsFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }

  Future<void> getVehicleModel(BrandEntity item) async {
    brandEntity = item;
    try {
      setStatus(Status.loading);

      vehicleModel = await _getVehicleModelsUsecase.call(GetVehicleModelsParams(
        tableCode: referenceTable.code,
        vehicleCode: selectedCategory.vehicleType,
        brandCode: brandEntity.code,
      ));

      setStatus(Status.success);
    } on VehicleModelFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }

  Future<void> getYearByModel(VehicleModelsEntity item) async {
    vehicleModelsEntity = item;
    try {
      setStatus(Status.loading);

      yearIdList.clear();
      yearIdList.addAll(await _getYearByModelUsecase.call(
        GetYearByModelParams(
          tableCode: referenceTable.code,
          vehicleCode: selectedCategory.vehicleType,
          brandCode: brandEntity.code,
          modelCode: vehicleModelsEntity.code,
        ),
      ));

      setStatus(Status.success);
    } on YearByModelFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }

  Future<void> getFipeTable(YearByModelEntity item) async {
    yearIdEntity = item;
    try {
      setStatus(Status.loading);

      fipeTable = await _getFipeTableUsecase.call(
        GetFipeParams(
          tableCode: referenceTable.code,
          vehicleCode: selectedCategory.vehicleType,
          brandCode: brandEntity.code,
          yearId: yearIdEntity.code,
          modelCode: vehicleModelsEntity.code,
        ),
      );

      _consultDate = DateTime.now();

      setStatus(Status.success);
    } on FipeTableFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }

  String formatDate() {
    final parsed = DateFormat("EEEE, dd 'de' MMMM 'de' yyyy, HH:mm", 'pt_BR')
        .format(_consultDate);

    return parsed;
  }
}
