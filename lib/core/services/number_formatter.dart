import 'package:intl/intl.dart';

String formatPrice(num price) {
  return NumberFormat.decimalPattern('en').format(price);
}
