import 'package:equatable/equatable.dart';

class ModelByYearEntity extends Equatable {
  final String label;
  final String value;

  const ModelByYearEntity({
    required this.label,
    required this.value,
  });

  factory ModelByYearEntity.empty() => const ModelByYearEntity(
        label: '',
        value: '',
      );

  @override
  List<Object?> get props => [label, value];
}
