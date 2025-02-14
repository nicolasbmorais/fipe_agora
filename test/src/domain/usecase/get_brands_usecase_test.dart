import 'package:fipe_agora/src/domain/repository/repository_interface.dart';
import 'package:fipe_agora/src/domain/usecase/get_brands_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../test_values.dart';
import 'get_reference_table_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FipeRepositoryInterface>()])
void main() {
  late MockFipeRepositoryInterface repository;
  late GetBrandsUsecase getBrandsUsecase;

  setUp(() {
    repository = MockFipeRepositoryInterface();
    getBrandsUsecase = GetBrandsUsecase(repository: repository);
  });

  test('Should return a list of brands', () async {
    when(repository.getBrands(
            tableCode: anyNamed('tableCode'),
            vehicleCode: anyNamed('vehicleCode')))
        .thenAnswer((_) async => tBrandEntityList());

    final response = await getBrandsUsecase(
        const GetBrandParams(tableCode: '290', vehicleCode: '1'));

    expect(response, tBrandEntityList());
  });

  test('Should return a empty list', () async {
    when(repository.getBrands(
            tableCode: anyNamed('tableCode'),
            vehicleCode: anyNamed('vehicleCode')))
        .thenAnswer((_) async => []);

    final response = await getBrandsUsecase(
        const GetBrandParams(tableCode: '20', vehicleCode: '1'));

    expect(response, []);
  });
}
