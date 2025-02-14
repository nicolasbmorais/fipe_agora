import 'package:fipe_agora/src/core/status.dart';
import 'package:flutter/foundation.dart';

class BaseController extends ChangeNotifier {
  Status _status = Status.pristine;

  void setStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  bool get isPristine => _status == Status.pristine;
  bool get isLoading => _status == Status.loading;
  bool get hasError => _status == Status.error;
  bool get hasSuccess => _status == Status.success;
}
