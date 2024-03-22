import 'package:intl/intl.dart';

String formatNumber(num price) {
  return NumberFormat.decimalPattern('en').format(price);
}
