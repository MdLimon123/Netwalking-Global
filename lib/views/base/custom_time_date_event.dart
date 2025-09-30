import 'package:intl/intl.dart';

String customTimeDateEvent(String dateOrTime) {
  try {
    if (dateOrTime.contains('-')) {

      DateTime parsedDate = DateTime.parse(dateOrTime);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } else {

      DateTime parsedTime = DateFormat('HH:mm:ss').parse(dateOrTime);
      return DateFormat('hh:mm a').format(parsedTime);
    }
  } catch (e) {
    return dateOrTime;
  }
}
