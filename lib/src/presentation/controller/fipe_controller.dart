import 'package:fipe_agora/src/common/base_controller.dart';
import 'package:fipe_agora/src/common/status.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/domain/usecase/get_brands_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_car_models_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_fipe_table_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_model_by_year_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_reference_table_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_yearmodel_usecase.dart';

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

  List<ReferenceTableEntity> referenceTableList = List.empty(growable: true);
  ReferenceTableEntity referenceTable = ReferenceTableEntity.empty();

  List<BrandEntity> brandList = List.empty(growable: true);
  BrandEntity brandEntity = BrandEntity.empty();

  VehicleModelsEntity vehicleModel = VehicleModelsEntity.empty();

  List<YearModelEntity> yearModelList = List.empty(growable: true);
  YearModelEntity yearModelEntity = YearModelEntity.empty();

  List<ModelByYearEntity> modelByYearList = List.empty(growable: true);
  ModelByYearEntity modelByYearEntity = ModelByYearEntity.empty();

  FipeTableEntity fipeTable = FipeTableEntity.empty();

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
    referenceTable = item;
    setStatus(Status.loading);
    try {
      brandList.clear();
      brandList.addAll(await _getBrandsUsecase.call(
        GetBrandParams(
            tableCode: referenceTable.codigo.toString(),
            vehicleCode: referenceTable.mes),
      ));

      setStatus(Status.success);
    } on Exception catch (_) {
      setStatus(Status.error);
    }
  }

  Future<void> getVehicleModel(BrandEntity item) async {
    brandEntity = item;
    setStatus(Status.loading);
    try {
      vehicleModel = await _getVehicleModelsUsecase.call(GetVehicleModelsParams(
        tableCode: referenceTable.codigo.toString(),
        vehicleCode: '1', //TODO: pegar dos 3 botoes de tipo de veiculo
        brandCode: brandEntity.value,
      ));

      setStatus(Status.success);
    } on Exception catch (_) {
      setStatus(Status.error);
    }
  }

  // Future<void> getYearModel(VehicleModels item) async {
  //   vehicleModel = item;
  //   setStatus(Status.loading);
  //   try {
  //     yearModelList.clear();
  //     yearModelList.addAll(await _getYearModelUsecase.call(
  //       GetYearModelParams(
  //         tableCode: referenceTable.codigo.toString(),
  //         vehicleCode: '1', //TODO: pegar dos 3 botoes de tipo de veiculo
  //         brandCode: brandEntity.value,
  //         modelCode: vehicleModel.value.toString(), //TODO: esta errado
  //       ),
  //     ));

  //     setStatus(Status.success);
  //   } on Exception catch (_) {
  //     setStatus(Status.error);
  //   }
  // }

  // Future<void> getFipeTable(VehicleModels item) async {
  //   vehicleModel = item;
  //   setStatus(Status.loading);
  //   try {
  //     fipeTable = await _getFipeTableUsecase.call(
  //       GetFipeParams(
  //         tableCode: referenceTable.codigo.toString(),
  //         vehicleCode: '1', //TODO: pegar dos 3 botoes de tipo de veiculo
  //         brandCode: brandEntity.value,
  //         modelCode: vehicleModel.value.toString(),
  //         year: yearModelEntity.value,
  //         fuelCode: vehicleModel.value.toString(),
  //         yearModel: yearModelEntity.value,
  //         consultType: "tradicional",
  //       ),
  //     );

  //     setStatus(Status.success);
  //   } on Exception catch (_) {
  //     setStatus(Status.error);
  //   }
  // }
}
