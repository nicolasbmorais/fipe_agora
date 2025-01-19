import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static final _instance = GetIt.instance;
  static GetIt get instance => _instance;

  static void setup() {
    _instance.registerSingleton<FipeController>(FipeController());
  }
}
