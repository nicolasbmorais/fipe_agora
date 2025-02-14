import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/vehicle_model.dart';
import 'package:fipe_agora/src/data/models/year_model.dart';
import 'package:fipe_agora/src/data/repository/fipe_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'fipe_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeDatasourceInterface>()])
void main() {
  late MockFipeDatasourceInterface fipeDataSource;
  late FipeRepositoryImpl fipeRepositoryImpl;

  setUp(() {
    fipeDataSource = MockFipeDatasourceInterface();
    fipeRepositoryImpl = FipeRepositoryImpl(fipeDataSource: fipeDataSource);
  });

  group('Function to get reference table', () {
    test('Should return a list of reference table', () async {
      when(fipeRepositoryImpl.getReferenceTable())
          .thenAnswer((_) async => tListReferenceTableModel());
      // Act
      final result = await fipeDataSource.getReferenceTable();

      // Assert
      expect(result, tListReferenceTableModel());
    });

    test('Should return a Failure', () async {
      when(fipeRepositoryImpl.getReferenceTable()).thenThrow(Exception());

      // Act and Assert
      expect(
        () async {
          await fipeRepositoryImpl.getReferenceTable();
        },
        throwsA(isA<Exception>()),
      );
    });
  });

  group('Function to get brands', () {
    test('Should return a list of reference table', () async {
      when(fipeRepositoryImpl.getBrands(tableCode: '290', vehicleCode: '1'))
          .thenAnswer((_) async => tBrandModelList());

      final response =
          await fipeDataSource.getBrands(tableCode: '290', vehicleCode: '1');

      expect(response, tBrandModelList());
    });

    test('Should return an empty list when no brands are available', () async {
      when(fipeRepositoryImpl.getBrands(tableCode: '290', vehicleCode: '1'))
          .thenAnswer((_) async => <BrandModel>[]);

      final response =
          await fipeDataSource.getBrands(tableCode: '290', vehicleCode: '1');

      expect(response, <BrandModel>[]);
    });

    test('Should throw an exception when getBrands fails', () async {
      when(fipeRepositoryImpl.getBrands(tableCode: '290', vehicleCode: '1'))
          .thenThrow(Exception('Failed to fetch brands'));

      expect(
        () async {
          await fipeDataSource.getBrands(tableCode: '290', vehicleCode: '1');
        },
        throwsA(isA<Exception>()),
      );
    });
  });

  group('Function to get car models', () {
    test('Should return a list of car model', () async {
      when(fipeRepositoryImpl.getVehicleModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      )).thenAnswer((_) async => tVehicleModel());

      final response = await fipeDataSource.getVehicleModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      );

      expect(response, tVehicleModel());
    });

    test('Should return an empty list when no VehicleModels are available',
        () async {
      when(fipeRepositoryImpl.getVehicleModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      )).thenAnswer((_) async => const VehicleModels(model: [], year: []));

      final response = await fipeDataSource.getVehicleModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      );
      expect(response, const VehicleModels(model: [], year: []));
    });

    test('Should throw an exception when getVehicleModels fails', () async {
      when(fipeRepositoryImpl.getVehicleModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      )).thenThrow(Exception('Failed to fetch VehicleModels'));

      expect(
        () async {
          await fipeDataSource.getVehicleModels(
            tableCode: 'tableCode',
            vehicleCode: 'vehicleCode',
            brandCode: 'brandCode',
          );
        },
        throwsA(isA<Exception>()),
      );
    });
  });

  group('Function to get year model', () {
    test('Should return a list of year model', () async {
      when(fipeRepositoryImpl.getYearModel(
              tableCode: 'tableCode',
              vehicleCode: 'vehicleCode',
              brandCode: 'brandCode',
              modelCode: 'modelCode'))
          .thenAnswer((_) async => tYearModelList());

      final response = await fipeDataSource.getYearModel(
          tableCode: 'tableCode',
          vehicleCode: 'vehicleCode',
          brandCode: 'brandCode',
          modelCode: 'modelCode');

      expect(response, tYearModelList());
    });

    test('Should return an empty list when no year model are available',
        () async {
      when(fipeRepositoryImpl.getYearModel(
              tableCode: 'tableCode',
              vehicleCode: 'vehicleCode',
              brandCode: 'brandCode',
              modelCode: 'modelCode'))
          .thenAnswer((_) async => <YearModel>[]);

      final response = await fipeDataSource.getYearModel(
          tableCode: 'tableCode',
          vehicleCode: 'vehicleCode',
          brandCode: 'brandCode',
          modelCode: 'modelCode');
      expect(response, <YearModel>[]);
    });

    test('Should throw an exception when getYearModel fails', () async {
      when(fipeRepositoryImpl.getYearModel(
              tableCode: 'tableCode',
              vehicleCode: 'vehicleCode',
              brandCode: 'brandCode',
              modelCode: 'modelCode'))
          .thenThrow(Exception('Failed to fetch YearModel'));

      expect(
        () async {
          await fipeDataSource.getYearModel(
              tableCode: 'tableCode',
              vehicleCode: 'vehicleCode',
              brandCode: 'brandCode',
              modelCode: 'modelCode');
        },
        throwsA(isA<Exception>()),
      );
    });
  });

  group('Function to get Fipe Table', () {
    test('Should Fipe Table Model', () async {
      when(fipeRepositoryImpl.getFipeTable(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
        modelCode: 'modelCode',
        consultType: 'consultType',
      )).thenAnswer((_) async => tFipeTableModel());

      final response = await fipeDataSource.getFipeTable(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
        modelCode: 'modelCode',
        consultType: 'consultType',
      );

      expect(response, tFipeTableModel());
    });

    test('Should return a empty Fipe Table Model', () async {
      when(fipeRepositoryImpl.getFipeTable(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
        modelCode: 'modelCode',
        consultType: 'consultType',
      )).thenAnswer((_) async => tEmptyFipeTableModel());
      final response = await fipeDataSource.getFipeTable(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
        modelCode: 'modelCode',
        consultType: 'consultType',
      );

      expect(response, tEmptyFipeTableModel());
    });

    test('Should throw an exception when Fipe Table Model fails', () async {
      when(fipeRepositoryImpl.getFipeTable(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
        modelCode: 'modelCode',
        consultType: 'consultType',
      )).thenThrow(Exception('Failed to fetch YearModel'));

      expect(
        () async {
          fipeDataSource.getFipeTable(
            tableCode: 'tableCode',
            vehicleCode: 'vehicleCode',
            brandCode: 'brandCode',
            year: 'year',
            fuelCode: 'fuelCode',
            yearModel: 'yearModel',
            modelCode: 'modelCode',
            consultType: 'consultType',
          );
        },
        throwsA(isA<Exception>()),
      );
    });
  });
}
