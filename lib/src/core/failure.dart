import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get msg;
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  @override
  String get msg => 'Desculpe, não foi possível acessar o servidor';
}
