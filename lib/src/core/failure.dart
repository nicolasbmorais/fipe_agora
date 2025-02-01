import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get msg;
  @override
  List<Object?> get props => [msg];
}

class ApiFailure extends Failure {
  @override
  String get msg => 'Desculpe, não foi possível acessar o servidor.';
}

class BrandsFailure extends Failure {
  final String? error;

  BrandsFailure({this.error});

  @override
  String get msg =>
      error ?? 'Desculpe, não foi possível listar as marcas. Tente novamente';
}
