import 'package:intl/intl.dart';

class Utils {
  static String dateToString(DateTime time, {String pattern = 'yyyy-MM-dd'}) {
    final df = new DateFormat(pattern);

    return time == null ? "" : df.format(time);
  }
}
