class ApiUtils {
  ApiUtils._();

  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String info = '/auth/info';
  static const String updateUser = '/auth/update_user';
  static const String renewToken = '/auth/renew_token';
}

class StringUtils {
  StringUtils._();

  static String tokenPref = 'tokenPref';
}
