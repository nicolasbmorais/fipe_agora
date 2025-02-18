import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_vehicle_models_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late FipeRepositoryInterface fipeRepositoryInterface;
  late GetVehicleModelsUsecase getVehicleModelsUsecase;

  setUp(() {
    fipeRepositoryInterface = MockFipeRepositoryInterface();
    getVehicleModelsUsecase =
        GetVehicleModelsUsecase(repository: fipeRepositoryInterface);
  });
  test('Get Car Models Usecase', () async {
    when(fipeRepositoryInterface.getVehicleModels(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
    )).thenAnswer((_) async => tVehicleModelEntityList());

    final response = await getVehicleModelsUsecase(const GetVehicleModelsParams(
      tableCode: 'tableCode',
      vehicleCode: 'vehicleCode',
      brandCode: 'brandCode',
    ));

    expect(response, response);
  });
}
