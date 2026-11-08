abstract final class AppConstants {
  AppConstants._();

  static const String logoAsset = 'assets/images/logo.png';
  static const String slider1Asset = 'assets/images/slider1.png';
  static const String slider2Asset = 'assets/images/slider2.webp';
  static const String truck1Asset = 'assets/images/truck1.png';
  static const String truck2Asset = 'assets/images/truck2.png';

  static const String iconTruckSvg = 'assets/icons/truck_black.svg';
  static const String iconWheelSvg = 'assets/icons/wheel.svg';
  static const String iconImageSvg = 'assets/icons/image.svg';
  static const String iconSearchSvg = 'assets/icons/search.svg';
  static const String iconShareSvg = 'assets/icons/share.svg';
  static const String iconSmsSvg = 'assets/icons/sms.svg';
  static const String iconChatSvg = 'assets/icons/chat.svg';
  static const String iconTruckMapMarkerSvg = 'assets/icons/truck_red.svg';
  static const String iconHeartOutlineSvg = 'assets/icons/heart_outline.svg';
  static const String iconHeartFillRedSvg = 'assets/icons/heart_fill_red.svg';

  // Profile / shared
  static const String iconSettingsSvg = 'assets/icons/settings.svg';
  static const String iconNewsSvg = 'assets/icons/news.svg';
  static const String iconInspectionSvg = 'assets/icons/inspection.svg';
  static const String iconEmailSvg = 'assets/icons/email.svg';
  static const String iconCallSvg = 'assets/icons/call.svg';
  static const String iconPersonSvg = 'assets/icons/person.svg';
  static const String iconPrivacyPolicySvg = 'assets/icons/privacy_policy.svg';
  static const String iconRatingSvg = 'assets/icons/rating.svg';
  static const String iconLogoutSvg = 'assets/icons/logout.svg';
  static const String iconLocationSvg = 'assets/icons/location.svg';

  // Admin web only
  static const Duration splashDelay = Duration(milliseconds: 1500);
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.lorryadda.example.com',
  );
}
