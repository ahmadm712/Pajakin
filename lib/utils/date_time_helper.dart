import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    // Date and Time Format
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    const timeSpecific = "08:00:00";
    final completeFormat = DateFormat('y/M/d H:m:s');

    // Today Format
    final todayDate = dateFormat.format(now);
    final todayDateAndTime = "$todayDate $timeSpecific";
    var resultToday = completeFormat.parseStrict(todayDateAndTime);

    // Tomorrow Format
    var formatted = resultToday.add(const Duration(seconds: 3));
    final nextMonthDate = dateFormat.format(formatted);
    final nextMonthDateAndTime = "$nextMonthDate $timeSpecific";
    var resultNextMonth = completeFormat.parseStrict(nextMonthDateAndTime);

    return now.isAfter(resultToday) ? resultNextMonth : resultToday;
  }
}
