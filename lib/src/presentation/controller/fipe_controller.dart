import 'dart:developer';

import 'package:fipe_agora/src/common/base_controller.dart';
import 'package:fipe_agora/src/domain/usecase/get_brands_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_car_models_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_fipe_table_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_model_by_year_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_reference_table_usecase.dart';
import 'package:fipe_agora/src/domain/usecase/get_yearmodel_usecase.dart';

class FipeController extends BaseController {
  final GetReferenceTableUsecase _getReferenceTableUsecase;
  final GetBrandsUsecase _getBrandsUsecase;
  final GetCarModelsUsecase _getCarModelsUsecase;
  final GetFipeTableUsecase _getFipeTableUsecase;
  final GetYearModelUsecase _getYearModelUsecase;
  final GetModelByYearUsecase _getModelByYearUsecase;

  FipeController({
    required GetReferenceTableUsecase getReferenceTableUsecase,
    required GetBrandsUsecase getBrandsUsecase,
    required GetCarModelsUsecase getCarModelsUsecase,
    required GetFipeTableUsecase getFipeTableUsecase,
    required GetYearModelUsecase getYearModelUsecase,
    required GetModelByYearUsecase getModelByYearUsecase,
  })  : _getReferenceTableUsecase = getReferenceTableUsecase,
        _getBrandsUsecase = getBrandsUsecase,
        _getCarModelsUsecase = getCarModelsUsecase,
        _getFipeTableUsecase = getFipeTableUsecase,
        _getYearModelUsecase = getYearModelUsecase,
        _getModelByYearUsecase = getModelByYearUsecase;

  void logButton() {
    log('Cliquei');
    notifyListeners();
  }
}
