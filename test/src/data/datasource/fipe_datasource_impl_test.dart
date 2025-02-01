import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_impl.dart';
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

  RequestOptions requestOptions = RequestOptions();

  setUp(() {
    dio = MockDio();
    datasourceImpl = FipeDatasourceImpl(dio: dio);
  });
  group('Reference Table Test', () {
    test('Should return reference table list', () async {
      when(dio.get(any)).thenAnswer((_) async {
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
      when(dio.get(any)).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
        () => datasourceImpl.getReferenceTable(),
        throwsA(isA<ApiFailure>()),
      );
    });
  });

  group('Brand List Test', () {
    test('Should return a brand list', () async {
      when(dio.get(any)).thenAnswer((_) async => Response(
            requestOptions: requestOptions,
            statusCode: 200,
            data: List.from(jsonDecode(fixture('brands.json'))),
          ));

      final result =
          await datasourceImpl.getBrands(tableCode: '290', vehicleCode: '1');

      expect(result, tBrandModelList());
    });

    test('Should throws error on get reference table list', () async {
      when(dio.get(any)).thenAnswer((_) async {
        return Response(
          requestOptions: requestOptions,
          statusCode: 400,
        );
      });

      expect(
        () => datasourceImpl.getBrands(tableCode: '290', vehicleCode: '1'),
        throwsA(isA<BrandsFailure>()),
      );
    });
  });
}
