class ReferenceTableException implements Exception {
  final String message;

  ReferenceTableException({String? message})
      : message = message ??
            'Desculpe, não foi possível listar as tabelas de referências. Tente novamente';
}

class BrandsException implements Exception {
  final String message;

  BrandsException({String? message})
      : message = message ??
            'Desculpe, não foi possível listar as marcas. Tente novamente';
}

class VehicleModelsException implements Exception {
  final String message;

  VehicleModelsException({String? message})
      : message = message ??
            'Desculpe, não foi possível listar os modelos. Tente novamente';
}

class YearByModelException implements Exception {
  final String message;

  YearByModelException({String? message})
      : message = message ??
            'Desculpe, não foi possível listar os anos. Tente novamente';
}

class FipeTableException implements Exception {
  final String message;

  FipeTableException({String? message})
      : message = message ??
            'Desculpe, não foi possível consultar a Tabela Fipe. Tente novamente';
}
