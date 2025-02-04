import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/car_model.dart';
import 'package:fipe_agora/src/data/models/model_by_year_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

List<ReferenceTableEntity> tListReferenceTableEntity() => [
      const ReferenceTableEntity(codigo: 317, mes: 'janeiro/2025'),
      const ReferenceTableEntity(codigo: 316, mes: 'dezembro/2024'),
    ];

List<ReferenceTableModel> tListReferenceTableModel() => [
      const ReferenceTableModel(codigo: 317, mes: 'janeiro/2025'),
      const ReferenceTableModel(codigo: 316, mes: 'dezembro/2024'),
    ];

List<BrandEntity> tBrandEntityList() => [
      const BrandEntity(label: 'Acura', value: '1'),
      const BrandEntity(label: 'Agrale', value: '2'),
    ];

List<BrandModel> tBrandModelList() => [
      const BrandModel(label: 'Acura', value: '1'),
      const BrandModel(label: 'Agrale', value: '2'),
    ];

List<CarModelsEntity> tCarModelEntityList() => [
      const CarModelsEntity(label: 'AM-825 Luxo 4.0 Diesel', value: 24),
      const CarModelsEntity(label: 'AM-825 Super Luxo 4.0 Diesel', value: 25),
    ];

List<CarModel> tCarModelList() => [
      const CarModel(label: 'AM-825 Luxo 4.0 Diesel', value: 24),
      const CarModel(label: 'AM-825 Super Luxo 4.0 Diesel', value: 25),
    ];

List<YearModelEntity> tYearModelEntityList() => [
      const YearModelEntity(label: "2011 Gasolina", value: "2011-1"),
      const YearModelEntity(label: "2010 Gasolina", value: "2010-1"),
    ];

List<YearModel> tYearModelList() => [
      const YearModel(label: "2011 Gasolina", value: "2011-1"),
      const YearModel(label: "2010 Gasolina", value: "2010-1"),
    ];

List<ModelByYearEntity> tModelByYearEntityList() => [
      const ModelByYearEntity(
        label: "AZERA 3.0 V6 24V 4p Aut.",
        value: "5726",
      ),
      const ModelByYearEntity(
        label: "AZERA GLS 3.3 V6 24V 4p Aut.",
        value: "4403",
      ),
    ];

List<ModelByYearModel> tModelByYearModelList() => [
      const ModelByYearModel(
        label: "AZERA 3.0 V6 24V 4p Aut.",
        value: "5726",
      ),
      const ModelByYearModel(
        label: "AZERA GLS 3.3 V6 24V 4p Aut.",
        value: "4403",
      ),
    ];
