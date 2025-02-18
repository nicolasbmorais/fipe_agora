import 'package:equatable/equatable.dart';

class ReferenceTableEntity extends Equatable {
  final String code;
  final String month;

  const ReferenceTableEntity({
    required this.code,
    required this.month,
  });

  factory ReferenceTableEntity.empty() => const ReferenceTableEntity(
        code: "",
        month: "",
      );

  @override
  List<Object?> get props => [code, month];
}
