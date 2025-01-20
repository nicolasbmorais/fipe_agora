import 'package:fipe_agora/src/data/datasource/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker internetChecker;
  late NetworkInfoImpl networkInfoImpl;

  setUp(() {
    internetChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(internetChecker: internetChecker);
  });
  test('Should return true if has internet', () async {
    when(internetChecker.hasConnection).thenAnswer((_) async => true);

    final result = await networkInfoImpl.isConnected;
    expect(result, true);
  });

  test('Should return false if dont has internet', () async {
    when(internetChecker.hasConnection).thenAnswer((_) async => false);

    final result = await networkInfoImpl.isConnected;
    expect(result, false);
  });
}
