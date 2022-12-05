import 'dart:developer' as developer;

class AppDebug {
  static bool get isDebug => const bool.fromEnvironment('dart.vm.product');

  static void log(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      level: 200,
      error: error,
      stackTrace: stackTrace,
      name: 'AppDebug',
    );
  }
}
