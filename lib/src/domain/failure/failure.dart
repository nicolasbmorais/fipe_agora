abstract class Failure {
  String? message;

  Failure({this.message});
}

class ReferenceTableFailure extends Failure {
  ReferenceTableFailure({super.message});
}

class BrandsFailure extends Failure {
  BrandsFailure({super.message});
}

class VehicleModelFailure extends Failure {
  VehicleModelFailure({super.message});
}

class YearModelFailure extends Failure {
  YearModelFailure({super.message});
}

class ModelByYearFailure extends Failure {
  ModelByYearFailure({super.message});
}

class FipeTableFailure extends Failure {
  FipeTableFailure({super.message});
}
