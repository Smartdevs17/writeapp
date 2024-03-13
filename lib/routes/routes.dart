class Routes {
  /// Initial Route Setter
  static Future<String> get initialRoute async {
    return login;
  }

  static const String login = "/loginScreen";
  static const String register = "/registerScreen";
  static const String auth = "/authScreen";
  static const String resetPassword = "/resetPasswordScreen";
  static const String home = "/homeScreen";
  static const String createDocument = "/createDocumentScreen";
  static const String document = "/documentScreen";
  static const String search = "/searchScreen";
  static const String settings = "/settings";
}
