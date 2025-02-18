import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String name;
  final String code;

  const BrandEntity({
    required this.name,
    required this.code,
  });

  factory BrandEntity.empty() => const BrandEntity(
        name: '',
        code: '',
      );

  @override
  List<Object?> get props => [name, code];
}
