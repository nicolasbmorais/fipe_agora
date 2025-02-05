import 'package:equatable/equatable.dart';

class YearModelEntity extends Equatable {
  final String label;
  final String value;

  const YearModelEntity({
    required this.label,
    required this.value,
  });

  factory YearModelEntity.empty() => const YearModelEntity(
        label: '',
        value: '',
      );

  @override
  List<Object?> get props => [label, value];
}
