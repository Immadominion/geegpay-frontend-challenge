import 'package:geegpay_afrique/core/constants/env_strings.dart';

extension DateTimeFormatter on DateTime {
  String toCustomFormat() {
    final months = [
      '', // Leave an empty string at index 0 to align with month numbering
      GeegyStrings.jan,
      GeegyStrings.feb,
      GeegyStrings.mar,
      GeegyStrings.apr,
      GeegyStrings.may,
      GeegyStrings.jun,
      GeegyStrings.jul,
      GeegyStrings.aug,
      GeegyStrings.sep,
      GeegyStrings.oct,
      GeegyStrings.nov,
      GeegyStrings.dec,
    ];

    final month = months[this.month];
    final day = this.day.toString().padLeft(2, '0');
    final year = this.year.toString();

    return '$month $day, $year';
  }
}


/// You can use this extension thus ==>
// void main() {
//   final now = DateTime.now();
//   final formattedDate = now.toCustomFormat();
//   print(formattedDate);
// }