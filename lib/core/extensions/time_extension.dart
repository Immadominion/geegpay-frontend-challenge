extension DateTimeFormatter on DateTime {
  String toCustomFormat() {
    final month = this.month.toString().padLeft(2, '0');
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