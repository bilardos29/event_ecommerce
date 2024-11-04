class ApiPath {

  //membership
  static String get login => '/login';
  static String get register => '/registration';
  static String get profile => '/profile';
  static String get updateProfile => '/profile/update';
  static String get updateProfileImage => '/profile/image';

  //information
  static String get banner => '/banner';
  static String get service => '/services';

  //transaction
  static String get balance => '/balance';
  static String get topup => '/topup';
  static String get transaction => '/transaction';
  static String get historyTransaction => '/transaction/history';
}