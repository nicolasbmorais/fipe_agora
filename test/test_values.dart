import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/fipe_table_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/data/models/vehicle_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';

List<ReferenceTableEntity> tListReferenceTableEntity() => [
      const ReferenceTableEntity(code: '317', month: 'janeiro/2025'),
      const ReferenceTableEntity(code: '316', month: 'dezembro/2024'),
    ];

List<ReferenceTableModel> tListReferenceTableModel() => [
      const ReferenceTableModel(code: '317', month: 'janeiro/2025'),
      const ReferenceTableModel(code: '316', month: 'dezembro/2024'),
    ];

List<BrandEntity> tBrandEntityList() => [
      const BrandEntity(name: 'Acura', code: '1'),
      const BrandEntity(name: 'Agrale', code: '2'),
    ];

List<BrandModel> tBrandModelList() => [
      const BrandModel(name: 'Acura', code: '1'),
      const BrandModel(name: 'Agrale', code: '2'),
    ];

List<VehicleModelsEntity> tVehicleModelEntityList() => [
      VehicleModelsEntity(code: '6146', name: '116iA 1.6 TB 16V 136cv 5p'),
      VehicleModelsEntity(code: '8946', name: '118i Sport 1.5 TB 12V Aut. 5p'),
    ];

List<VehicleModels> tVehicleModelModelList() => [
      VehicleModels(code: '6146', name: '116iA 1.6 TB 16V 136cv 5p'),
      VehicleModels(code: '8946', name: '118i Sport 1.5 TB 12V Aut. 5p'),
    ];

List<YearByModelEntity> tYearByModelEntityList() => [
      const YearByModelEntity(name: "2011 Gasolina", code: "2011-1"),
      const YearByModelEntity(name: "2010 Gasolina", code: "2010-1"),
    ];

List<YearByModel> tYearByModelList() => [
      const YearByModel(name: "2011 Gasolina", code: "2011-1"),
      const YearByModel(name: "2010 Gasolina", code: "2010-1"),
    ];

FipeTableEntity tFipeTableEntity() => const FipeTableEntity(
      brand: "BMW",
      codeFipe: "009171-5",
      fuel: "Gasolina",
      fuelAcronym: 'G',
      model: "116iA 1.6 TB 16V 136cv 5p",
      modelYear: 2015,
      price: r"R$ 76.291,00",
      priceHistory: [
        PriceHistoryEntity(
          month: 'abril de 2024',
          price: r'R$ 10.000,00',
          reference: '1',
        )
      ],
      referenceMonth: "fevereiro de 2025 ",
      vehicleType: 1,
    );

FipeTableModel tFipeTableModel() => const FipeTableModel(
      brand: "BMW",
      codeFipe: "009171-5",
      fuel: "Gasolina",
      fuelAcronym: 'G',
      model: "116iA 1.6 TB 16V 136cv 5p",
      modelYear: 2015,
      price: r"R$ 76.291,00",
      priceHistory: [
        PriceHistory(
          month: 'abril de 2024',
          price: r'R$ 10.000,00',
          reference: '1',
        )
      ],
      referenceMonth: "fevereiro de 2025 ",
      vehicleType: 1,
    );

FipeTableModel tEmptyFipeTableModel() => const FipeTableModel(
      brand: '',
      codeFipe: '',
      fuel: '',
      fuelAcronym: '',
      model: '',
      modelYear: 0,
      price: '',
      priceHistory: [],
      referenceMonth: '',
      vehicleType: 0,
    );
