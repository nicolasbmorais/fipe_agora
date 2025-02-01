import 'package:equatable/equatable.dart';

class CarModelsEntity extends Equatable {
  final String label;
  final int value;

  const CarModelsEntity({
    required this.label,
    required this.value,
  });

  @override
  List<Object?> get props => [label, value];
}
