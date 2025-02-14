import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/core/base_controller.dart';
import 'package:fipe_agora/src/core/status.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/domain/usecase/usecase.dart';

class VehicleType extends Equatable {
  final String name;
  final int id;

  const VehicleType({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
}

class FipeController extends BaseController {
  final GetReferenceTableUsecase _getReferenceTableUsecase;
  final GetBrandsUsecase _getBrandsUsecase;
  final GetVehicleModelsUsecase _getVehicleModelsUsecase;
  final GetFipeTableUsecase _getFipeTableUsecase;
  final GetYearModelUsecase _getYearModelUsecase;

  FipeController({
    required GetReferenceTableUsecase getReferenceTableUsecase,
    required GetBrandsUsecase getBrandsUsecase,
    required GetVehicleModelsUsecase getVehicleModelsUsecase,
    required GetFipeTableUsecase getFipeTableUsecase,
    required GetYearModelUsecase getYearModelUsecase,
    required GetModelByYearUsecase getModelByYearUsecase,
  })  : _getReferenceTableUsecase = getReferenceTableUsecase,
        _getBrandsUsecase = getBrandsUsecase,
        _getVehicleModelsUsecase = getVehicleModelsUsecase,
        _getFipeTableUsecase = getFipeTableUsecase,
        _getYearModelUsecase = getYearModelUsecase;

  final List<VehicleType> categories = [
    const VehicleType(name: 'Carros', id: 1),
    const VehicleType(name: 'Motos', id: 2),
    const VehicleType(name: 'Caminhões', id: 3),
  ];

  VehicleType selectedCategory = const VehicleType(name: 'Carros', id: 1);

  String _vehicleCodeType = '1';

  List<ReferenceTableEntity> referenceTableList = List.empty(growable: true);
  ReferenceTableEntity referenceTable = ReferenceTableEntity.empty();

  List<BrandEntity> brandList = List.empty(growable: true);
  BrandEntity brandEntity = BrandEntity.empty();

  VehicleModelsEntity vehicleModel = VehicleModelsEntity.empty();
  ModelEntity modelEntity = ModelEntity.empty();

  List<YearModelEntity> yearModelList = List.empty(growable: true);
  YearModelEntity yearModelEntity = YearModelEntity.empty();

  List<ModelByYearEntity> modelByYearList = List.empty(growable: true);
  ModelByYearEntity modelByYearEntity = ModelByYearEntity.empty();

  FipeTableEntity _fipeTable = FipeTableEntity.empty();
  FipeTableEntity get fipeTable => _fipeTable;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  reset() {
    brandEntity = BrandEntity.empty();
    modelEntity = ModelEntity.empty();
    yearModelEntity = YearModelEntity.empty();
    modelByYearEntity = ModelByYearEntity.empty();
    _fipeTable = FipeTableEntity.empty();
    const VehicleType(name: 'Carros', id: 1);
    notifyListeners();
  }

  void selectCategory(VehicleType value) {
    selectedCategory = value;
    _vehicleCodeType = value.id.toString();
    notifyListeners();
  }

  void selectVehicleType(String type) {
    _vehicleCodeType = type;
    notifyListeners();
  }

  Future<void> getReferenceTable() async {
    setStatus(Status.loading);
    try {
      referenceTableList.clear();
      referenceTableList
          .addAll(await _getReferenceTableUsecase.call(NoParams()));

      setStatus(Status.success);
    } on Exception catch (_) {
      setStatus(Status.error);
    }
  }

  Future<void> getBrand(ReferenceTableEntity item) async {
    setStatus(Status.loading);
    referenceTable = item;
    try {
      brandList.clear();
      brandList.addAll(await _getBrandsUsecase.call(
        GetBrandParams(
          tableCode: referenceTable.codigo.toString(),
          vehicleCode: _vehicleCodeType,
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
    setStatus(Status.loading);
    try {
      vehicleModel = await _getVehicleModelsUsecase.call(GetVehicleModelsParams(
        tableCode: referenceTable.codigo.toString(),
        vehicleCode: _vehicleCodeType,
        brandCode: brandEntity.value,
      ));

      setStatus(Status.success);
    } on VehicleModelFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }

  Future<void> getYearModel(ModelEntity item) async {
    modelEntity = item;
    setStatus(Status.loading);
    try {
      yearModelList.clear();
      yearModelList.addAll(await _getYearModelUsecase.call(
        GetYearModelParams(
          tableCode: referenceTable.codigo.toString(),
          vehicleCode: _vehicleCodeType,
          brandCode: brandEntity.value,
          modelCode: modelEntity.value.toString(),
        ),
      ));

      setStatus(Status.success);
    } on YearModelFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }

  Future<void> getFipeTable(YearModelEntity item) async {
    yearModelEntity = item;
    setStatus(Status.loading);
    try {
      _fipeTable = await _getFipeTableUsecase.call(
        GetFipeParams(
          tableCode: referenceTable.codigo.toString(),
          vehicleCode: _vehicleCodeType,
          brandCode: brandEntity.value,
          year: yearModelEntity.value,
          fuelCode: yearModelEntity.value.substring(5),
          yearModel: yearModelEntity.value.substring(0, 4),
          modelCode: modelEntity.value.toString(),
          consultType: "tradicional",
        ),
      );

      setStatus(Status.success);
    } on FipeTableFailure catch (error) {
      _errorMessage = error.message ?? 'Ocorreu um erro. Tente novamente';
      setStatus(Status.error);
    }
  }
}
