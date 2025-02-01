import 'dart:developer';

import 'package:fipe_agora/src/common/base_controller.dart';

class FipeController extends BaseController {
  void logButton() {
    log('Cliquei');
    notifyListeners();
  }
}
