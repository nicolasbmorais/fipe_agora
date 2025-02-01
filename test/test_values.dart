import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/car_models_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/car_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';

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

List<CarModelsModel> tCarModelList() => [
      const CarModelsModel(label: 'AM-825 Luxo 4.0 Diesel', value: 24),
      const CarModelsModel(label: 'AM-825 Super Luxo 4.0 Diesel', value: 25),
    ];
