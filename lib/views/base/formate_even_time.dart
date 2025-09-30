import 'package:intl/intl.dart';

String formatEventTime(String timeStr) {

  DateTime time = DateFormat("HH:mm:ss").parse(timeStr);


  return DateFormat("h:mm a").format(time);
}
