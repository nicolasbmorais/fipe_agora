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
  test('Should return reference table list', () async {
    when(dio.get(any)).thenAnswer((_) async {
      return Response(
        requestOptions: requestOptions,
        statusCode: 200,
        data: List.from(jsonDecode(fixture('reference_table.json'))),
      );
    });

    final result = await datasourceImpl.getReferenceTable();

    expect(result, listReferenceTableModel());
  });

  test('Should throws error on get reference table list', () async {
    when(dio.get(any)).thenAnswer((_) async {
      return Response(
        requestOptions: requestOptions,
        statusCode: 500,
      );
    });

    expect(
      () => datasourceImpl.getReferenceTable(),
      throwsA(isA<ApiFailure>()),
    );
  });
}
