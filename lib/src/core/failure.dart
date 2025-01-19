import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get msg;
  @override
  List<Object?> get props => [];
}

class NoConnection extends Failure {
  @override
  String get msg => 'Desculpe, você não está conectado a internet';
}
