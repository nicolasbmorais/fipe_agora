import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String label;
  final String value;

  const BrandEntity({
    required this.label,
    required this.value,
  });

  factory BrandEntity.empty() => const BrandEntity(
        label: '',
        value: '',
      );

  @override
  List<Object?> get props => [label, value];
}
