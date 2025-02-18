abstract class Failure {
  String? message;

  Failure({required this.message});
}

class ReferenceTableFailure extends Failure {
  ReferenceTableFailure({required super.message});
}

class BrandsFailure extends Failure {
  BrandsFailure({required super.message});
}

class VehicleModelFailure extends Failure {
  VehicleModelFailure({required super.message});
}

class YearByModelFailure extends Failure {
  YearByModelFailure({required super.message});
}

class FipeTableFailure extends Failure {
  FipeTableFailure({required super.message});
}
