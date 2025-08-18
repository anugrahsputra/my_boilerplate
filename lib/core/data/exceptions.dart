class ServerException implements Exception {
  ServerException({this.message = 'Server Exception'});
  final String message;

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  NetworkException({this.message = 'NetworkException'});
  final String message;

  @override
  String toString() => message;
}

class UnauthorizedException implements Exception {
  UnauthorizedException({this.message = 'UnauthorizedException'});
  final String message;

  @override
  String toString() => message;
}

class BadRequestException implements Exception {
  BadRequestException({this.message = 'BadRequestException'});
  final String message;

  @override
  String toString() => message;
}

class ForbiddenException implements Exception {
  ForbiddenException({this.message = 'ForbiddenException'});
  final String message;

  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  NotFoundException({this.message = 'ForbiddenException'});
  final String message;

  @override
  String toString() => message;
}

class CacheException implements Exception {
  CacheException({this.message = 'CacheException'});
  final String message;

  @override
  String toString() => message;
}

class DatabaseException implements Exception {
  DatabaseException({this.message = 'DatabaseException'});
  final String message;

  @override
  String toString() => message;
}

class UnknownException implements Exception {
  UnknownException({this.message = 'UnknownException'});
  final String message;

  @override
  String toString() => message;
}
