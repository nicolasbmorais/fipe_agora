import 'package:equatable/equatable.dart';

class ReferenceTableEntity extends Equatable {
  final int codigo;
  final String mes;

  const ReferenceTableEntity({
    required this.codigo,
    required this.mes,
  });

  factory ReferenceTableEntity.empty() => const ReferenceTableEntity(
        codigo: 317,
        mes: 'janeiro/2025',
      );

  @override
  List<Object?> get props => [codigo, mes];
}
