import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_model_by_year_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late FipeRepositoryInterface fipeRepositoryInterface;
  late GetModelByYearUsecase getModelByYearUsecase;

  setUp(() {
    fipeRepositoryInterface = MockFipeRepositoryInterface();
    getModelByYearUsecase =
        GetModelByYearUsecase(repository: fipeRepositoryInterface);
  });
  test('Get Car Models Usecase', () async {
    when(fipeRepositoryInterface.getModelByYear(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      year: 'year',
      fuelCode: 'fuelCode',
      yearModel: 'yearModel',
    )).thenAnswer((_) async => tModelByYearEntityList());

    final response = await getModelByYearUsecase(const GetrModelByYearParams(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      year: 'year',
      fuelCode: 'fuelCode',
      yearModel: 'yearModel',
    ));

    expect(response, response);
  });
}
