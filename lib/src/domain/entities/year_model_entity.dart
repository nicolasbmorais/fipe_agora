import 'package:equatable/equatable.dart';

class YearByModelEntity extends Equatable {
  final String name;
  final String code;

  const YearByModelEntity({
    required this.name,
    required this.code,
  });

  factory YearByModelEntity.empty() => const YearByModelEntity(
        name: '',
        code: '',
      );

  @override
  List<Object?> get props => [name, code];
}
