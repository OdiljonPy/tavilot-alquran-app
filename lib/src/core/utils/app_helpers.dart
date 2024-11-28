import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../infrastructure/translations/locale_keys.g.dart';
import '../../presentation/styles/style.dart';
import '../constants/constants.dart';
import 'local_storage.dart';

class AppHelpers {
  AppHelpers._();

  static String phoneNumberSpaceRemover(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
  }
  static MaskTextInputFormatter phoneFormatter() {
    return MaskTextInputFormatter(
      mask: '+998 (##) ###-##-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
      type: MaskAutoCompletionType.lazy,
    );
  }

  static String errorCodeToMessage(int errorCode) {
    switch (errorCode) {
      case 1:
        return LocaleKeys.invalidInputProvided.tr();
      case 2:
        return LocaleKeys.resourceNotFound.tr();
      case 3:
        return LocaleKeys.validateError.tr();
      case 4:
        return LocaleKeys.incorrectPassword.tr();
      case 5:
        return LocaleKeys.userDoesNotExist.tr();
      case 6:
        return LocaleKeys.userAlreadyExists.tr();
      case 7:
        return LocaleKeys.unauthorizedAccess.tr();
      default:
        return LocaleKeys.unknownError.tr();
    }
  }



  // static getPhotoGallery(ValueChanged<String> onChange) async {
  //   if(Platform.isMacOS){
  //     FilePickerResult? result;
  //     try {
  //       result = await FilePicker.platform.pickFiles(type: FileType.image);
  //       if (result?.files.first.path != null) {
  //         onChange.call(result?.files.first.path ?? "");
  //       }
  //     } catch (e, s) {
  //       debugPrint('===> trying to select file $e $s');
  //     }
  //   }else{
  //     XFile? file;
  //     try {
  //       file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     } catch (ex) {
  //       debugPrint('===> trying to select image $ex');
  //     }
  //     if (file != null) {
  //       onChange.call(file.path);
  //     }
  //   }
  // }
  //
  // static Future getVideoGallery(ValueChanged<String> onChange) async {
  //   XFile? file;
  //   try {
  //     file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  //   } catch (ex) {
  //     debugPrint('===> trying to select image $ex');
  //   }
  //   if (file != null) {
  //     onChange.call(file.path);
  //   }
  // }


  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    double radius = 16,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) =>
          Padding(padding: MediaQuery.viewInsetsOf(context), child: modal),
    );
  }

  static String timeFormatMulti(List<DateTime?> time) {
    String response = '';
    if (time.isEmpty) {
      response += AppHelpers.getTranslation(TrKeys.selectTime);

      return response;
    }
    for (int i = 0; i < time.length; i++) {
      if (time[i] != null) {
        response += DateFormat("HH:mm").format(time[i]!);
        if (i == 0 && time.length > 1) {
          response += '  -  ';
        }
      }
    }
    return response;
  }

  static Color getServiceStatusColor(String? value) {
    switch (value) {
      case 'new':
        return Style.blueColor;
      case 'accepted':
        return Style.green;
      case 'null':
      case 'canceled':
      case 'cancel':
        return Style.red;
      default:
        return Style.primary;
    }
  }


  // static String? getAppName() {
  //   final List<SettingsData> settings = LocalStorage.getSettingsList();
  //   for (final setting in settings) {
  //     if (setting.key == 'title') {
  //       return setting.value;
  //     }
  //   }
  //   return 'Uzmart';
  // }
  //
  // static int getType() {
  //   final List<SettingsData> settings = LocalStorage.getSettingsList();
  //   for (final setting in settings) {
  //     if (setting.key == 'ui_type') {
  //       return (int.tryParse(setting.value ?? "1") ?? 1) - 1;
  //     }
  //   }
  //   return 0;
  // }

  // static String getNameColor(String? value) {
  //   if (checkIfHex(value)) {
  //     final color = Color(int.parse('0xFF${value?.substring(1, 7)}'));
  //     return color.colorName;
  //   }
  //   return value ?? TrKeys.unKnow;
  // }

  static String dateFormatFilter(
      {required DateTime? start, required DateTime? end}) {
    return '${DateFormat("MMM d, yyyy").format(start ?? DateTime.now())} - ${DateFormat("MMM d,yyyy").format(end ?? DateTime.now())}';
  }


  static String dateFormat(DateTime? time) {
    return DateFormat("MMM d,yyyy").format(time ?? DateTime.now());
  }

  static String dateFormatHours(DateTime? time) {
    return DateFormat("hh:mm a").format(time ?? DateTime.now());
  }

  static String dateFormatMMDHM(DateTime? date) {
    if (date == null) {
      return '';
    }
    return DateFormat("MMMM dd, hh:mm").format(date.toLocal());
  }

  static String dateFormatDay(DateTime? time) {
    return DateFormat("yyyy-MM-dd").format(time ?? DateTime.now());
  }

  // static stockHandler(
  //   e, {
  //   int bagIndex = 0,
  //   VoidCallback? success,
  // }) async {
  //   try {
  //     final msg = errorHandler(e);
  //     final temp = msg.substring(msg.indexOf('.') + 1);
  //     int? index = int.tryParse(temp.substring(0, temp.indexOf('.')));
  //     if (index == null) {
  //       return;
  //     }
  //     final bags = LocalStorage.getBags();
  //     final bagProduct = bags[bagIndex].bagProducts;
  //     bagProduct?.removeAt(index);
  //     bags[bagIndex] = bags[bagIndex].copyWith(bagProducts: bagProduct);
  //     await LocalStorage.setBags(bags);
  //     success?.call();
  //   } catch (s) {
  //     return;
  //   }
  // }

  static successSnackBar(
      BuildContext context, {
        String? text,
      }) {
    Fluttertoast.showToast(
        msg: text ?? "",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Style.primary,
        textColor: Style.white,
        fontSize: 16.0);
  }

  static errorSnackBar(BuildContext context, {required String text}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Style.primary,
        textColor: Style.white,
        fontSize: 16.0);
  }

  static openDialog({
    required BuildContext context,
    required String title,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
            backgroundColor: Style.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              margin: EdgeInsets.all(24.w),
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Style.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      getTranslation(title),
                      textAlign: TextAlign.center,
                      style: Style.interNormal(size: 18),
                    ),
                    24.verticalSpace,
                    // CustomButton(
                    //   onTap: () => Navigator.pop(context),
                    //   title: getTranslation(TrKeys.close),
                    // ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  // static String numberFormat({num? number, String? symbol, bool? isOrder}) {
  //   number = number ?? 0;
  //   // if (LocalStorage.getSelectedCurrency()?.position == "before") {
  //   //   return NumberFormat.currency(
  //   //     customPattern: '\u00a4 #,###.#',
  //   //     symbol: (isOrder ?? false)
  //   //         ? (symbol ?? LocalStorage.getSelectedCurrency()?.symbol)
  //   //         : LocalStorage.getSelectedCurrency()?.symbol,
  //   //     decimalDigits: number > 99999 ? 0 : 2,
  //   //   ).format(number);
  //   // } else {
  //     return NumberFormat.currency(
  //       customPattern: '#,###.# \u00a4',
  //       symbol: (isOrder ?? false)
  //           ? (symbol ?? LocalStorage.getSelectedCurrency()?.symbol)
  //           : LocalStorage.getSelectedCurrency()?.symbol,
  //       decimalDigits: number > 99999 ? 0 : 2,
  //     ).format(number);
  //   }
  // }

  static String dateFormatForOrder(String? time) {
    return '${DateFormat('dd.MM.yyyy').format(DateTime.tryParse(time ?? '')?.toLocal() ?? DateTime.now())} | ${DateFormat('hh:mm').format(DateTime.tryParse(time ?? '')?.toLocal() ?? DateTime.now())}';
  }

  // static String? getInitialLocale() {
  //   final List<SettingsData> settings = LocalStorage.getSettingsList();
  //   for (final setting in settings) {
  //     if (setting.key == 'lang') {
  //       return setting.value;
  //     }
  //   }
  //   return null;
  // }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    return length > 3 ? url.substring(length - 3, length) == 'svg' : false;
  }

  static bool checkIfHex(String? type) {
    if (type == null || type.isEmpty) {
      return false;
    }
    if (type.length == 7 && type[0] == '#') {
      return true;
    } else {
      return false;
    }
  }

  static String dateFormatForNotification(DateTime? time) {
    return DateFormat("d MMM, h:mm a").format(time ?? DateTime.now());
  }

  static String errorHandler(e) {
    try {
      return (e.runtimeType == DioException)
          ? ((e as DioException).response?.data["message"] == "Bad request."
              ? (e.response?.data["params"] as Map).values.first[0]
              : e.response?.data["message"])
          : e.toString();
    } catch (s) {
      return (e.runtimeType == DioException)
          ? ((e as DioException).response?.data.toString().substring(
                  (e.response?.data.toString().indexOf("<title>") ?? 0) + 7,
                  e.response?.data.toString().indexOf("</title") ?? 0))
              .toString()
          : e.toString();
    }
  }

  static List<String> extractTextFromControllers(
      List<TextEditingController> controllers) {
    List<String> texts = [];
    for (var controller in controllers) {
      texts.add(controller.text.toLowerCase());
    }
    return texts;
  }

  static Color getStatusColor(String? value) {
    switch (value) {
      case 'pending':
        return Style.pendingDark;
      case 'new':
        return Style.blueColor;
      case 'accepted':
        return Style.deepPurple;
      case 'ready':
      case 'progress':
        return Style.revenueColor;
      case 'on_a_way':
        return Style.black;
      case 'unpublished':
        return Style.orange;
      case 'published':
      case 'active':
      case 'true':
      case 'delivered':
      case 'cash':
      case 'paid':
      case 'approved':
        return Style.green;
      case 'inactive':
      case 'false':
      case 'null':
      case 'canceled':
      case 'cancel':
        return Style.red;
      default:
        return Style.primary;
    }
  }


  // static double? getInitialLongitude() {
  //   final List<SettingsData> settings = LocalStorage.getSettingsList();
  //   for (final setting in settings) {
  //     if (setting.key == 'location') {
  //       final String? latString =
  //           setting.value?.substring(0, setting.value?.indexOf(','));
  //       if (latString == null) {
  //         return null;
  //       }
  //       final String? lonString = setting.value
  //           ?.substring((latString.length) + 2, setting.value?.length);
  //       if (lonString == null) {
  //         return null;
  //       }
  //       final double lon = double.parse(lonString);
  //       return lon;
  //     }
  //   }
  //   return null;
  // }
  //
  // static bool getSubscription() {
  //   final List<SettingsData> settings = LocalStorage.getSettingsList();
  //   for (final setting in settings) {
  //     if (setting.key == 'subscription') {
  //       return (setting.value ?? "0") == "1";
  //     }
  //   }
  //   return false;
  // }

  static void showAlertDialog({
    required BuildContext context,
    required Widget child,
    double radius = 16,
    Color? backgroundColor,
  }) {
    AlertDialog alert = AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      contentPadding: EdgeInsets.all(20.r),
      iconPadding: EdgeInsets.zero,
      content: child,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showSnackBar(BuildContext context, String title,
      {bool isIcon = false}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      backgroundColor: Style.white,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.fromLTRB(MediaQuery.sizeOf(context).width - 400.w, 0,
          32, MediaQuery.sizeOf(context).height - 160.h),
      content: Row(
        children: [
          if (isIcon)
            Padding(
              padding: EdgeInsets.only(right: 8.r),
              child: const Icon(
                FlutterRemix.checkbox_circle_fill,
                color: Style.primary,
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Style.black,
              ),
            ),
          ),
        ],
      ),
      action: SnackBarAction(
        label: LocaleKeys.close.tr(),
        disabledTextColor: Style.black,
        textColor: Style.black,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String getTranslation(String trKey) {
    final Map<String, dynamic> translations = LocalStorage.getTranslations();
    for (final key in translations.keys) {
      if (trKey == key) {
        return translations[key];
      }
    }
    return trKey;
  }

  static ExtrasType getExtraTypeByValue(String? value) {
    switch (value) {
      case 'color':
        return ExtrasType.color;
      case 'text':
        return ExtrasType.text;
      case 'image':
        return ExtrasType.image;
      default:
        return ExtrasType.text;
    }
  }

  static DateTime getMinTime(String openTime) {
    final int openHour = int.parse(openTime.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, openHour);
  }

  static DateTime getMaxTime(String closeTime) {
    final int closeHour = int.parse(closeTime.substring(0, 2));
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, closeHour);
  }

  static String getOrderStatusText(OrderStatus value) {
    switch (value) {
      case OrderStatus.newOrder:
        return "new";
      case OrderStatus.accepted:
        return "accepted";
      case OrderStatus.ready:
        return "ready";
      case OrderStatus.onAWay:
        return "on_a_way";
      case OrderStatus.delivered:
        return "delivered";
      default:
        return "canceled";
    }
  }

  static OrderStatus getOrderStatus(String? value, {bool? isNextStatus}) {
    if (isNextStatus ?? false) {
      switch (value) {
        case 'new':
          return OrderStatus.accepted;
        case 'accepted':
          return OrderStatus.ready;
        case 'ready':
          return OrderStatus.onAWay;
        case 'on_a_way':
          return OrderStatus.delivered;
        default:
          return OrderStatus.canceled;
      }
    } else {
      switch (value) {
        case 'new':
          return OrderStatus.newOrder;
        case 'accepted':
          return OrderStatus.accepted;
        case 'ready':
          return OrderStatus.ready;
        case 'on_a_way':
          return OrderStatus.onAWay;
        case 'delivered':
          return OrderStatus.delivered;
        default:
          return OrderStatus.canceled;
      }
    }
  }

  static String getPinCodeText(int index) {
    switch (index) {
      case 0:
        return "1";
      case 1:
        return "2";
      case 2:
        return "3";
      case 3:
        return "4";
      case 4:
        return "5";
      case 5:
        return "6";
      case 6:
        return "7";
      case 7:
        return "8";
      case 8:
        return "9";
      case 10:
        return "0";
      default:
        return "0";
    }
  }

  static Widget getStatusType(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: text == "new"
            ? Style.blue
            : text == "accept"
                ? Colors.deepPurple
                : text == "ready"
                    ? Style.rate
                    : Style.primary,
      ),
      child: Text(
        getTranslation(text),
        style: GoogleFonts.inter(
          fontSize: 12.sp,
          color: Style.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
  //
  // static bool getPhoneRequired() {
  //   final List<SettingsData> settings = LocalStorage.getSettingsList();
  //   for (final setting in settings) {
  //     if (setting.key == 'before_order_phone_required') {
  //       return (setting.value ?? "0") == "1";
  //     }
  //   }
  //   return false;
  // }

  // static List<List<Extras>> cartesian(List<List<dynamic>> args) {
  //   List<List<Extras>> r = [];
  //   int max = args.length - 1;
  //
  //   void helper(List<Extras> arr, int i) {
  //     for (int j = 0, l = args[i].length; j < l; j++) {
  //       List<Extras> a = List.from(arr);
  //       a.add(args[i][j]);
  //       if (i == max) {
  //         r.add(a);
  //       } else {
  //         helper(a, i + 1);
  //       }
  //     }
  //   }
  //
  //   helper([], 0);
  //   return r;
  // }
}

extension Time on DateTime {
  bool toEqualTime(DateTime time) {
    if (time.year != year) {
      return false;
    } else if (time.month != month) {
      return false;
    } else if (time.day != day) {
      return false;
    }
    return true;
  }

  bool toEqualTimeWithHour(DateTime time) {
    if (time.year != year) {
      return false;
    } else if (time.month != month) {
      return false;
    } else if (time.day != day) {
      return false;
    } else if (time.hour != hour) {
      return false;
    }
    return true;
  }
}

extension FindPriceIndex on List<num> {
  double findPriceIndex(num price) {
    if (price != 0) {
      int startIndex = 0;
      int endIndex = 0;
      for (int i = 0; i < length; i++) {
        if ((this[i]) >= price.toInt()) {
          startIndex = i;
          break;
        }
      }
      for (int i = 0; i < length; i++) {
        if ((this[i]) <= price) {
          endIndex = i;
        }
      }
      if (startIndex == endIndex) {
        return length.toDouble();
      }

      num a = this[startIndex] - this[endIndex];
      num b = price - this[endIndex];
      num c = b / a;
      return startIndex.toDouble() + c;
    } else {
      return 0;
    }
  }
}

// extension FindPrice on List<IncomeChartResponse> {
//   num findPrice(DateTime time) {
//     num price = 0;
//     for (int i = 0; i < length; i++) {
//       if (this[i].time!.toEqualTime(time)) {
//         price = this[i].totalPrice ?? 0;
//       }
//     }
//     return price;
//   }
//
//   num findPriceWithHour(DateTime time) {
//     num price = 0;
//     for (int i = 0; i < length; i++) {
//       if (this[i].time!.toEqualTimeWithHour(time)) {
//         price = this[i].totalPrice ?? 0;
//       }
//     }
//     return price;
//   }
// }



extension BoolParsing on String {
  bool toBool() {
    return this == "true" || this == "1";
  }
}
