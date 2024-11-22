import 'dart:convert';
import 'package:al_quran/src/models/data/bookmark_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/models.dart';
import '../constants/constants.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static Future<void> setOtherTranslations(
      {required Map<String, dynamic>? translations,
        required String key}) async {
    SharedPreferences? local = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(translations);
    await local.setString(key, encoded);
  }

  static Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  static Future<void> setUserRate(int? userRate) async {
    if (_preferences != null) {
      await _preferences!.setInt(AppConstants.keyUserRate, userRate ?? 1);
    }
  }

  static Future<void> setSystemLanguage(LanguageData? lang) async {
    if (_preferences != null) {
      final String langString = jsonEncode(lang?.toJson());
      await _preferences!.setString(AppConstants.keySystemLanguage, langString);
    }
  }

  static Future<void> setLanguageData(LanguageData? langData) async {
    final String lang = jsonEncode(langData?.toJson());
    setLangLtr(langData?.backward);
    await _preferences?.setString(AppConstants.keyLanguageData, lang);
  }

  static LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }
  static Future<void> setLangLtr(bool? backward) async {
    if (_preferences != null) {
      await _preferences?.setBool(AppConstants.keyLangLtr, backward ?? false);
    }
  }

  static bool getLangLtr() => !(_preferences?.getBool(AppConstants.keyLangLtr) ?? true);

  static LanguageData? getSystemLanguage() {
    final lang = _preferences?.getString(AppConstants.keySystemLanguage);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  static int getUserRate() => _preferences?.getInt(AppConstants.keyUserRate) ?? 1;


  static void deleteToken() => _preferences?.remove(AppConstants.keyToken);

  static setPinCode(String pinCode) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.pinCode, pinCode);
    }
  }

  static String getPinCode() => _preferences?.getString(AppConstants.pinCode) ?? '';

  static void deletePinCode() => _preferences?.remove(AppConstants.pinCode);

  // static Future<void> setSettingsList(List<SettingsData> settings) async {
  //   if (_preferences != null) {
  //     final List<String> strings =
  //         settings.map((setting) => jsonEncode(setting.toJson())).toList();
  //     await _preferences!
  //         .setStringList(AppConstants.keyGlobalSettings, strings);
  //   }
  // }
  //
  // static List<SettingsData> getSettingsList() {
  //   final List<String> settings =
  //       _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
  //   final List<SettingsData> settingsList = settings
  //       .map(
  //         (setting) => SettingsData.fromJson(jsonDecode(setting)),
  //       )
  //       .toList();
  //   return settingsList;
  // }

  static void deleteSettingsList() =>
      _preferences?.remove(AppConstants.keyGlobalSettings);

  static Future<void> setActiveLocale(String? locale) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyActiveLocale, locale ?? '');
    }
  }

  static Future<void> setTranslations(Map<String, dynamic>? translations) async {
    if (_preferences != null) {
      final String encoded = jsonEncode(translations);
      await _preferences!.setString(AppConstants.keyTranslations, encoded);
    }
  }

  static Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static void deleteTranslations() =>
      _preferences?.remove(AppConstants.keyTranslations);

  // static  Future<void> setSelectedCurrency(CurrencyData currency) async {
  //   if (_preferences != null) {
  //     final String currencyString = jsonEncode(currency.toJson());
  //     await _preferences!
  //         .setString(AppConstants.keySelectedCurrency, currencyString);
  //   }
  // }

  static Future<Map<String, dynamic>> getOtherTranslations(
      {required String key}) async {
    SharedPreferences? local = await SharedPreferences.getInstance();

    final String encoded = local.getString(key) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }


  // static CurrencyData? getSelectedCurrency() {
  //   final savedString =
  //   _preferences?.getString(AppConstants.keySelectedCurrency);
  //   if (savedString == null) {
  //     return null;
  //   }
  //   final map = jsonDecode(savedString);
  //   if (map == null) {
  //     return null;
  //   }
  //   return CurrencyData.fromJson(map);
  // }

  static void deleteSelectedCurrency() =>
      _preferences?.remove(AppConstants.keySelectedCurrency);

  static Future<void> setBookmark(List<Bookmark> bookmarks) async {
    if (_preferences != null) {
      final List<String> strings =
      bookmarks.map((bookmark) => jsonEncode(bookmark.toJson())).toList();
      await _preferences!.setStringList(AppConstants.keyBookmark, strings);
    }
  }

  // static Future<void> setAddress(LocationData locationData) async {
  //   if (_preferences != null) {
  //     final  String location = jsonEncode(locationData.toJson());
  //     await _preferences!
  //         .setString(AppConstants.keyAddress, location);
  //   }
  // }

  // static LocationData? getAddress() {
  //   final savedString =
  //   _preferences?.getString(AppConstants.keyAddress);
  //   if (savedString == null) {
  //     return null;
  //   }
  //   final map = jsonDecode(savedString);
  //   if (map == null) {
  //     return null;
  //   }
  //   return LocationData.fromJson(map);
  // }

  static Future<void> setWallet(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString =
      wallet != null ? jsonEncode(wallet.toJson()) : '';
      await _preferences!.setString(AppConstants.keyWallet, walletString);
    }
  }

  static Wallet? getWallet() {
    final savedString = _preferences?.getString(AppConstants.keyWallet);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  static List<Bookmark> getBookmarks() {
    final List<String> bags =
        _preferences?.getStringList(AppConstants.keyBookmark) ?? [];
    final List<Bookmark> localBags = bags
        .map(
          (bag) => Bookmark.fromJson(jsonDecode(bag)),
        )
        .toList(growable: true);
    return localBags;
  }

  //
  // static Future<void> setShop(ShopData? shop) async {
  //   if (_preferences != null) {
  //     final String shopString = shop != null ? jsonEncode(shop.toJson()) : '';
  //     await _preferences!.setString(AppConstants.keyShop, shopString);
  //   }
  // }
  //
  // static ShopData? getShop() {
  //   final savedString = _preferences?.getString(AppConstants.keyShop);
  //   if (savedString == null) {
  //     return null;
  //   }
  //   final map = jsonDecode(savedString);
  //   if (map == null) {
  //     return null;
  //   }
  //   return ShopData.fromJson(map);
  // }

  static Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  static UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  static void deleteUser() => _preferences?.remove(AppConstants.keyUser);

  static void clearStore() {
    deletePinCode();
    deleteToken();
    deleteUser();
  }
}
