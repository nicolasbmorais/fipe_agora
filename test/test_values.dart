import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/fipe_table_model.dart';
import 'package:fipe_agora/src/data/models/model_by_year_model.dart';
import 'package:fipe_agora/src/data/models/reference_table_model.dart';
import 'package:fipe_agora/src/data/models/vehicle_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/fipe_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/model_by_year_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
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

VehicleModelsEntity tVehicleModelEntity() => const VehicleModelsEntity(
      model: [
        ModelEntity(label: 'AM-825 Luxo 4.0 Diesel', value: 24),
      ],
      year: [
        YearEntity(label: '1999 Gasolina', value: '1999-1'),
      ],
    );

VehicleModels tVehicleModel() => const VehicleModels(
      model: [
        Model(label: 'AM-825 Luxo 4.0 Diesel', value: 24),
      ],
      year: [
        Year(label: '1999 Gasolina', value: '1999-1'),
      ],
    );

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

FipeTableEntity tFipeTableEntity() => const FipeTableEntity(
      value: r"R$ 76.291,00",
      brand: "BMW",
      model: "116iA 1.6 TB 16V 136cv 5p",
      modelYear: 2015,
      fuel: "Gasolina",
      fipeCode: "009171-5",
      referenceMonth: "fevereiro de 2025 ",
      authentication: "75tw7085y1vt",
      vehicleType: 1,
      fuelAcronym: 'G',
      consultationDate: "terça-feira, 11 de fevereiro de 2025 16:16",
    );

FipeTableModel tFipeTableModel() => const FipeTableModel(
      value: r"R$ 76.291,00",
      brand: "BMW",
      model: "116iA 1.6 TB 16V 136cv 5p",
      modelYear: 2015,
      fuel: "Gasolina",
      fipeCode: "009171-5",
      referenceMonth: "fevereiro de 2025 ",
      authentication: "75tw7085y1vt",
      vehicleType: 1,
      fuelAcronym: 'G',
      consultationDate: "terça-feira, 11 de fevereiro de 2025 16:16",
    );

FipeTableModel tEmptyFipeTableModel() => const FipeTableModel(
      value: '',
      brand: '',
      model: '',
      modelYear: 0,
      fuel: '',
      fipeCode: '',
      referenceMonth: '',
      authentication: '',
      vehicleType: 0,
      fuelAcronym: '',
      consultationDate: '',
    );
