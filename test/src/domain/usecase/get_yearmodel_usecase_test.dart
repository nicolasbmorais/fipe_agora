import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_year_by_model_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late MockFipeRepositoryInterface repository;
  late GetYearByModelUsecase getYearByModelUsecase;

  setUp(() {
    repository = MockFipeRepositoryInterface();
    getYearByModelUsecase = GetYearByModelUsecase(repository: repository);
  });
  test('Should return a list of year and model', () async {
    when(repository.getYearByModel(
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      modelCode: 'modelCode',
      tableCode: 'tableCode',
    )).thenAnswer((_) async => tYearByModelEntityList());

    final response = await getYearByModelUsecase(const GetYearByModelParams(
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      modelCode: 'modelCode',
      tableCode: 'tableCode',
    ));

    expect(response, tYearByModelEntityList());
  });
}
