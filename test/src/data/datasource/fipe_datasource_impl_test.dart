import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_impl.dart';
import 'package:fipe_agora/src/data/exceptions/fipe_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixtures.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../test_values.dart';

@GenerateNiceMocks([MockSpec<FipeDatasourceImpl>()])
void main() {
  late MockDio dio;
  late FipeDatasourceImpl datasourceImpl;

  RequestOptions requestOptions = RequestOptions(path: '/fake_path');

  setUp(() {
    dio = MockDio();
    datasourceImpl = FipeDatasourceImpl(dio: dio);
  });
  group('Reference Table Test', () {
    test('Should return reference table list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: List.from(jsonDecode(fixture('reference_table.json'))),
        );
      });

      final result = await datasourceImpl.getReferenceTable();

      expect(result, tListReferenceTableModel());
    });

    test('Should throws error on get reference table list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
        () => datasourceImpl.getReferenceTable(),
        throwsA(isA<ReferenceTableException>()),
      );
    });
  });

  group('Brand List Test', () {
    test('Should return a brand list', () async {
      when(dio.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => Response(
                requestOptions: requestOptions,
                statusCode: 200,
                data: List.from(jsonDecode(fixture('brands.json'))),
              ));

      final result =
          await datasourceImpl.getBrands(tableCode: '290', vehicleCode: '1');

      expect(result, tBrandModelList());
    });

    test('Should throws error on get reference table list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
        () => datasourceImpl.getBrands(tableCode: '290', vehicleCode: '1'),
        throwsA(isA<BrandsException>()),
      );
    });
  });

  group('Vehicle Model Test', () {
    test('Should return Vehicle Model', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: jsonDecode(fixture('car_models.json')),
        );
      });

      final result = await datasourceImpl.getVehicleModels(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
      );

      expect(result, tVehicleModel());
    });

    test('Should throws error on get reference table list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
        () => datasourceImpl.getVehicleModels(
          tableCode: 'tableCode',
          vehicleCode: 'vehicleCode',
          brandCode: 'brandCode',
        ),
        throwsA(isA<VehicleModelsException>()),
      );
    });
  });
  group('Year model List Test', () {
    test('Should return year model list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: List.from(jsonDecode(fixture('year_model.json'))),
        );
      });

      final result = await datasourceImpl.getYearModel(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        modelCode: 'modelCode',
      );

      expect(result, tYearModelList());
    });

    test('Should throws error on get reference table list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
        () => datasourceImpl.getYearModel(
          tableCode: 'tableCode',
          vehicleCode: 'vehicleCode',
          brandCode: 'brandCode',
          modelCode: 'modelCode',
        ),
        throwsA(isA<YearModelException>()),
      );
    });
  });

  group('Model by Year List Test', () {
    test('Should return Model by Year list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: List.from(jsonDecode(fixture('model_by_year.json'))),
        );
      });

      final result = await datasourceImpl.getModelByYear(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
      );

      expect(result, tModelByYearModelList());
    });

    test('Should throws error on get Model by Year list', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
          () => datasourceImpl.getModelByYear(
                tableCode: 'tableCode',
                vehicleCode: 'vehicleCode',
                brandCode: 'brandCode',
                year: 'year',
                fuelCode: 'fuelCode',
                yearModel: 'yearModel',
              ),
          throwsA(isA<ModelByYearException>()));
    });
  });
  group('Fipe Table Test', () {
    test('Should return Fipe Table', () async {
      when(dio.post(any, data: anyNamed('data')))
          .thenAnswer((invocation) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 200,
          data: jsonDecode(fixture('fipe_table.json')) as Map<String, dynamic>,
        );
      });

      final result = await datasourceImpl.getFipeTable(
        tableCode: 'tableCode',
        vehicleCode: 'vehicleCode',
        brandCode: 'brandCode',
        year: 'year',
        fuelCode: 'fuelCode',
        yearModel: 'yearModel',
        modelCode: 'modelCode',
        consultType: 'consultType',
      );

      expect(result, tFipeTableModel());
    });

    test('Should throws error on get Fipe Table', () async {
      when(dio.post(any, data: anyNamed('data'))).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
          () => datasourceImpl.getFipeTable(
                tableCode: 'tableCode',
                vehicleCode: 'vehicleCode',
                brandCode: 'brandCode',
                year: 'year',
                fuelCode: 'fuelCode',
                yearModel: 'yearModel',
                modelCode: 'modelCode',
                consultType: 'consultType',
              ),
          throwsA(isA<FipeTableException>()));
    });
  });
}
