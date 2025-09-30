import 'package:intl/intl.dart';

String formatEventDate(String dateStr) {
  DateTime eventDate = DateTime.parse(dateStr);
  DateTime today = DateTime.now();


  bool isToday = eventDate.year == today.year &&
      eventDate.month == today.month &&
      eventDate.day == today.day;

  if (isToday) {
    return "Today";
  } else {
    return DateFormat("d MMM").format(eventDate);
  }
}
