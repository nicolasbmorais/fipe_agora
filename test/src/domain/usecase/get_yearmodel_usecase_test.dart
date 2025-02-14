import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_yearmodel_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late MockFipeRepositoryInterface repository;
  late GetYearModelUsecase getYearModelUsecase;

  setUp(() {
    repository = MockFipeRepositoryInterface();
    getYearModelUsecase = GetYearModelUsecase(repository: repository);
  });
  test('Should return a list of year and model', () async {
    when(repository.getYearModel(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      modelCode: 'modelCode',
    )).thenAnswer((_) async => tYearModelEntityList());

    final response = await getYearModelUsecase(const GetYearModelParams(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      modelCode: 'modelCode',
    ));

    expect(response, response);
  });
}
