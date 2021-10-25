class ListDataAPP {
  static const String appName = "Nikel Management";
  static const String appHomePage = "Home Page";
}

class ListDataAPI {
  static const String domain = "http://local_igs_nickel_system.com/";
  static const String domainUrl = domain + "api/";
  static const String domainUrlData = domain + "assets/user/";
  static var domainHeader = {"Authorization": "Basic ZmlhbnNlbnNvckBnbWFpbC5jb206dGlnYWNvbnN1bHRpbmcxMjM="};

  static const String urlCheckVersion = domainUrl + "mobile/check-version";
  static const String urlProsesLogin = domainUrl + "mobile/login";
  static const String urlGetDataUser = domainUrl + "mobile/get-data-user";
  static const String urlGetNotification = domainUrl + "mobile/get-notifications";
}
