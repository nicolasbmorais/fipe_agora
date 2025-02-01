import 'package:equatable/equatable.dart';

class ReferenceTableEntity extends Equatable {
  final int codigo;
  final String mes;

  const ReferenceTableEntity({
    required this.codigo,
    required this.mes,
  });

  @override
  List<Object?> get props => [codigo, mes];
}
