import 'package:intl/intl.dart';

class UtilFun {
  static String valueUsername(String value) {
    if (value.isEmpty) return 'Username Can\'t empty!';
  }

  static String valuePassword(String value) {
    if (value.isEmpty) return 'Password Can\'t empty!';
  }

  static String dateFormatUntil(gettime) {
    DateTime dateTime = DateTime.parse(gettime).toLocal();
    final f = new DateFormat('dd MMM hh:mm aa');
    return f.format(dateTime);
  }

  static String fullDateFormatUntil(gettime) {
    DateTime dateTime = DateTime.parse(gettime).toLocal();
    final f = new DateFormat('dd MMM yyyy hh:mm aa');
    return f.format(dateTime);
  }

}
