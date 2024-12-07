
import 'constants.dart';

class AppConstants {
  AppConstants._();

  /// shared preferences keys
  static const String keyLangSelected = 'keyLangSelected';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyToken = 'keyToken';
  static const String keyRefreshToken = 'keyRefreshToken';
  static const String keyRefreshDay = 'keyRefreshDay';
  static const String keyUserRate = 'keyUserRate';
  static const String keyWallet = 'keyWallet';
  static const String keySystemLanguage = 'keySystemLanguage';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keyActiveLocale = 'keyActiveLocale';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyShop = 'keyShop';
  static const String keyTranslations = 'keyTranslations';
  static const String keySelectedCurrency = 'keySelectedCurrency';
  static const String keyBookmark = 'keyBookmarks';
  static const String keyUser = 'keyUser';
  static const String keyAddress = 'keyAddress';
  static const String pinCode = 'pinCode';
  static const String heroLogo = 'heroLogo';
  static const String demoSellerLogin = 'altinyildiz@gmail.com';
  static const String demoSellerPassword = 'altinyildiz';
  static const String demoAdminLogin = 'H&M@gmail.com';
  static const String demoAdminPassword = 'githubit';
  static const Duration refreshTime = Duration(seconds: 60);
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;
  static const Duration animationDuration = Duration(milliseconds: 375);
  static const String chatGpt =
      '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';
  static const String initialCountryCode = '+1';
  static const String kWindowsScheme = 'alquran';


  static const int hoursADay = 24;
  static const int minutesADay = 1440;
  static List deliveryTypeList = [TrKeys.inHouse, TrKeys.ownSeller];
  static final List<String> weekTitles = ["M", "T", "W", "T", "F", "S", "S"];
}

enum DropDownType { categories, users }

enum ExtrasType { color, text, image }

enum ChairPosition { top, bottom, left, right }

enum CalendarType { day, week }

enum UploadType {
  extras,
  brands,
  categories,
  shopsLogo,
  shopsBack,
  products,
  reviews,
  users,
  stocks,
  discounts,
}

enum OrderStatus {
  newOrder,
  accepted,
  ready,
  onAWay,
  delivered,
  canceled,
}


enum MasterStatus {
  newMaster,
  acceptedMaster,
  cancelledMaster,
  rejectedMaster,
}

enum ProductStatus { published, pending, unpublished }

enum CategoryStatus { published, pending, unpublished }

enum MinuteSlotSize {
  minutes15,
  minutes30,
  minutes60,
}
enum WeekDays {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
enum LineStyle {
  solid,
  dashed,
}
