import 'package:equatable/equatable.dart';
import 'package:fipe_agora/src/domain/failure/failure.dart';
import 'package:fipe_agora/src/core/usecase.dart';
import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/repository/repository_interface.dart';

class GetBrandsUsecase extends Usecase<List<BrandEntity>, GetBrandParams> {
  final FipeRepositoryInterface repository;

  GetBrandsUsecase({required this.repository});

  @override
  Future<List<BrandEntity>> call(GetBrandParams params) async {
    try {
      return await repository.getBrands(
        tableCode: params.tableCode,
        vehicleCode: params.vehicleCode,
      );
    } on Exception catch (e) {
      throw BrandsFailure(message: e.toString());
    }
  }
}

class GetBrandParams extends Equatable {
  final String tableCode;
  final String vehicleCode;

  const GetBrandParams({required this.tableCode, required this.vehicleCode});

  @override
  List<Object?> get props => [tableCode, vehicleCode];
}
