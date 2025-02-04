import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
import 'package:fipe_agora/src/data/models/brands_model.dart';
import 'package:fipe_agora/src/data/models/car_model.dart';
import 'package:fipe_agora/src/data/models/model_by_year_model.dart';
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
      when(fipeRepositoryImpl.getReferenceTable()).thenThrow(ApiFailure());

      // Act and Assert
      expect(
        () async {
          await fipeRepositoryImpl.getReferenceTable();
        },
        throwsA(isA<ApiFailure>()),
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
      when(fipeRepositoryImpl.getCarModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      )).thenAnswer((_) async => tCarModelList());

      final response = await fipeDataSource.getCarModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      );

      expect(response, tCarModelList());
    });

    test('Should return an empty list when no CarModels are available',
        () async {
      when(fipeRepositoryImpl.getCarModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      )).thenAnswer((_) async => <CarModel>[]);

      final response = await fipeDataSource.getCarModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      );
      expect(response, <CarModel>[]);
    });

    test('Should throw an exception when getCarModels fails', () async {
      when(fipeRepositoryImpl.getCarModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      )).thenThrow(Exception('Failed to fetch CarModels'));

      expect(
        () async {
          await fipeDataSource.getCarModels(
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

  group('Function to get model by year', () {
    test('Should return a list of  model by year', () async {
      when(fipeRepositoryImpl.getModelByYear(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
      )).thenAnswer((_) async => tModelByYearModelList());

      final response = await fipeDataSource.getModelByYear(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
      );

      expect(response, tModelByYearModelList());
    });

    test('Should return an empty list when no model are available', () async {
      when(fipeRepositoryImpl.getModelByYear(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
      )).thenAnswer((_) async => <ModelByYearModel>[]);

      final response = await fipeDataSource.getModelByYear(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
      );
      expect(response, <ModelByYearModel>[]);
    });

    test('Should throw an exception when getModelByYear fails', () async {
      when(fipeRepositoryImpl.getModelByYear(
              tableCode: 'tableCode',
              vehicleCode: 'vehicleCode',
              brandCode: 'brandCode',
              year: 'year',
              fuelCode: 'fuelCode',
              yearModel: 'yearModel'))
          .thenThrow(Exception('Failed to fetch ModelByYear'));

      expect(
        () async {
          await fipeDataSource.getModelByYear(
            tableCode: 'tableCode',
            vehicleCode: 'vehicleCode',
            brandCode: 'brandCode',
            year: 'year',
            fuelCode: 'fuelCode',
            yearModel: 'yearModel',
          );
        },
        throwsA(isA<Exception>()),
      );
    });
  });
}
