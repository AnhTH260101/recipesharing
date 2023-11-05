import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({
    required this.message,
    required this.statusCode,
  }) : assert(
          statusCode is String || statusCode is int,
          'Status code must be a ${statusCode.runtimeType}',
        );

  final String message;
  final dynamic statusCode;

  String getErrorMessage() => '$message Error: $statusCode';

  @override
  List<Object> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  CacheFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class ServerFailure extends Failure {
  ServerFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class NoInternetFailure extends Failure {
  NoInternetFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class UnauthenticatedFailure extends Failure {
  UnauthenticatedFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class ForbiddenFailure extends Failure {
  ForbiddenFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class ConflictFailure extends Failure {
  ConflictFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class ServiceUnavailableFailure extends Failure {
  ServiceUnavailableFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class GatewayTimeoutFailure extends Failure {
  GatewayTimeoutFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class BadGatewayFailure extends Failure {
  BadGatewayFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class RequestTimeoutFailure extends Failure {
  RequestTimeoutFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class TooManyRequestsFailure extends Failure {
  TooManyRequestsFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class BadRequestFailure extends Failure {
  BadRequestFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class UnprocessableEntityFailure extends Failure {
  UnprocessableEntityFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class UnsupportedMediaTypeFailure extends Failure {
  UnsupportedMediaTypeFailure(
      {required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class InternalFailure extends Failure {
  InternalFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class NotImplementedFailure extends Failure {
  NotImplementedFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}

class UnknownFailure extends Failure {
  UnknownFailure({required String message, required int statusCode})
      : super(message: message, statusCode: statusCode);
}
