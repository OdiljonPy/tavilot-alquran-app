import '../../models/data/calendar_event_data.dart';
import '../../models/data/chart_data.dart';
import '../../models/response/income_chart_response.dart';
import '../constants/app_constants.dart';

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

  bool compareWithoutTime(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }

  int getDayDifference(DateTime date) => DateTime.utc(year, month, day)
      .difference(DateTime.utc(date.year, date.month, date.day))
      .inDays
      .abs();

  int getWeekDifference(DateTime date, {WeekDays start = WeekDays.monday}) =>
      (firstDayOfWeek(start: start)
                  .difference(date.firstDayOfWeek(start: start))
                  .inDays
                  .abs() /
              7)
          .ceil();

  List<DateTime> datesOfWeek({WeekDays start = WeekDays.monday}) {
    final startDay =
        DateTime(year, month, day - (weekday - start.index - 1) % 7);

    return [
      startDay,
      DateTime(startDay.year, startDay.month, startDay.day + 1),
      DateTime(startDay.year, startDay.month, startDay.day + 2),
      DateTime(startDay.year, startDay.month, startDay.day + 3),
      DateTime(startDay.year, startDay.month, startDay.day + 4),
      DateTime(startDay.year, startDay.month, startDay.day + 5),
      DateTime(startDay.year, startDay.month, startDay.day + 6),
    ];
  }

  DateTime firstDayOfWeek({WeekDays start = WeekDays.monday}) =>
      DateTime(year, month, day - ((weekday - start.index - 1) % 7));

  DateTime lastDayOfWeek({WeekDays start = WeekDays.monday}) =>
      DateTime(year, month, day + (6 - (weekday - start.index - 1) % 7));

  int get getTotalMinutes => hour * 60 + minute;

  DateTime copyFromMinutes([int totalMinutes = 0]) => DateTime(
        year,
        month,
        day,
        totalMinutes ~/ 60,
        totalMinutes % 60,
      );

  DateTime get withoutTime => DateTime(year, month, day);

  bool get isDayStart => hour % 24 == 0 && minute % 60 == 0;
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

// extension FindPriceChart on List<ChartData> {
//   num findPrice(DateTime time) {
//     num price = 0;
//     for (int i = 0; i < length; i++) {
//       if (this[i].time!.toEqualTime(time)) {
//         price = this[i].count ?? 0;
//       }
//     }
//     return price;
//   }
//
//   num findPriceWithHour(DateTime time) {
//     num price = 0;
//     for (int i = 0; i < length; i++) {
//       if (this[i].time!.toEqualTimeWithHour(time)) {
//         price = this[i].count ?? 0;
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

extension Minutes on MinuteSlotSize {
  int get minutes {
    switch (this) {
      case MinuteSlotSize.minutes15:
        return 15;
      case MinuteSlotSize.minutes30:
        return 30;
      case MinuteSlotSize.minutes60:
        return 60;
    }
  }
}

// extension CalendarList on List<CalendarEventData> {
//   void addEventInSortedManner(CalendarEventData event) {
//     var addIndex = -1;
//     for (var i = 0; i < length; i++) {
//       if (event.startTime!.compareTo(this[i].startTime!) <= 0) {
//         addIndex = i;
//         break;
//       }
//     }
//
//     if (addIndex > -1) {
//       insert(addIndex, event);
//     } else {
//       add(event);
//     }
//   }
// }
