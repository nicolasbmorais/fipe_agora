import 'package:fipe_agora/src/core/failure.dart';
import 'package:fipe_agora/src/data/datasource/fipe_datasource_interface.dart';
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
      when(fipeDataSource.getReferenceTable())
          .thenAnswer((_) async => listReferenceTableModel());
      // Act
      final result = await fipeDataSource.getReferenceTable();

      // Assert
      expect(result, listReferenceTableModel());
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
}
