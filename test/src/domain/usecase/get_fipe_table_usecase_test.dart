import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_fipe_table_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late FipeRepositoryInterface repository;
  late GetFipeTableUsecase getFipeTableUsecase;

  setUp(() {
    repository = MockFipeRepositoryInterface();
    getFipeTableUsecase = GetFipeTableUsecase(repository: repository);
  });
  test('Get Fipe Table UseCase ...', () async {
    when(repository.getFipeTable(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      yearId: 'yearId',
      modelCode: 'modelCode',
    )).thenAnswer((_) async => tFipeTableEntity());

    final response = await getFipeTableUsecase(const GetFipeParams(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      yearId: 'yearId',
      modelCode: 'modelCode',
    ));

    expect(response, tFipeTableEntity());
  });
}
