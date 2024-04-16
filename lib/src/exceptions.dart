import 'package:http/http.dart';

import '../sse_client.dart';

enum ConnectionExceptionType { invalidStatusCode, invalidHeader }

abstract class ConnectionException implements Exception {
  final String message;
  final BaseResponse? response;

  const ConnectionException(this.message, this.response);
}

class InvalidResponseCodeException extends ConnectionException {
  const InvalidResponseCodeException(super.message, super.response);
}

class InvalidResponseHeaderException extends ConnectionException {
  const InvalidResponseHeaderException(super.message, super.response);
}

class ConnectionStateException implements Exception {
  final String message;
  final ConnectionState connectionState;

  const ConnectionStateException(this.message, this.connectionState);
}

class UnexpectedStreamErrorException implements Exception {
  final String message;
  final Object error;
  final StackTrace stackTrace;

  const UnexpectedStreamErrorException(
      this.message, this.error, this.stackTrace);
}

class UnexpectedStreamDoneException implements Exception {
  final String message;

  const UnexpectedStreamDoneException(this.message);
}
