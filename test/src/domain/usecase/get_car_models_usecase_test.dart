import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_car_models_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late FipeRepositoryInterface fipeRepositoryInterface;
  late GetCarModelsUsecase getCarModelsUsecase;

  setUp(() {
    fipeRepositoryInterface = MockFipeRepositoryInterface();
    getCarModelsUsecase =
        GetCarModelsUsecase(fipeRepository: fipeRepositoryInterface);
  });
  test('Get Car Models Usecase', () async {
    when(fipeRepositoryInterface.getCarModels(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      modelCode: 'modelCode',
    )).thenAnswer((_) async => tCarModelEntityList());

    final response = await getCarModelsUsecase(const GetCarModelsParams(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
      modelCode: 'modelCode',
    ));

    expect(response, response);
  });
}
