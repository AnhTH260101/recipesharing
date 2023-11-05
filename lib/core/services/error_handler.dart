import 'package:recipesharing/core/services/logger.dart';

class ErrorHandler {
  static void handleException(dynamic error, [StackTrace? stackTrace]) {
    Logger.error('Error: $error');
    if (stackTrace != null) {
      Logger.error(stackTrace.toString());
    }
  }
}
