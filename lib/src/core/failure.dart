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

class CarModelFailure extends Failure {
  final String? error;

  CarModelFailure({this.error});

  @override
  String get msg =>
      error ?? 'Desculpe, não foi possível listar os modelos. Tente novamente';
}

class YearModelFailure extends Failure {
  final String? error;

  YearModelFailure({this.error});

  @override
  String get msg =>
      error ??
      'Desculpe, não foi possível listar os anos e modelos. Tente novamente';
}

class ModelByYearFailure extends Failure {
  final String? error;

  ModelByYearFailure({this.error});

  @override
  String get msg =>
      error ??
      'Desculpe, não foi possível listar os anos e modelos. Tente novamente';
}

class FipeFailure extends Failure {
  final String? error;

  FipeFailure({this.error});

  @override
  String get msg =>
      error ??
      'Desculpe, não foi possível consultar a tabela Fipe. Tente novamente';
}
