import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_reference_table_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late MockFipeRepositoryInterface repository;
  late GetReferenceTableUsecase usecase;

  setUp(() {
    repository = MockFipeRepositoryInterface();
    usecase = GetReferenceTableUsecase(repository: repository);
  });
  test('Should return a list of reference tables', () async {
    // Arrange
    when(repository.getReferenceTable())
        .thenAnswer((_) async => tListReferenceTableEntity()); 

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, tListReferenceTableEntity());
  });

  test('Should return a empty list of reference tables', () async {
    // Arrange
    when(repository.getReferenceTable()).thenAnswer((_) async => []);

    // Act
    final result = await usecase(NoParams());

    // Assert
    expect(result, []);
  });
}
