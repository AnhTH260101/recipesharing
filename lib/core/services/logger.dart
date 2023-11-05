class Logger {
  const Logger._();
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _white = '\x1B[37m';
  static const String _reset = '\x1B[0m';
  static const String _magenta = '\x1B[35m';

  static void log(String message, {String color = _white}) {
    print('$color$message$_reset');
  }

  static void error(String message) {
    log(message, color: _red);
  }

  static void success(String message) {
    log(message, color: _green);
  }

  static void warning(String message) {
    log(message, color: _yellow);
  }

  static void info(String message) {
    log(message, color: _blue);
  }

  static void debug(String message) {
    log(message, color: _magenta);
  }
}
