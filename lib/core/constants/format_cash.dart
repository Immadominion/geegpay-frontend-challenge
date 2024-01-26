import 'package:intl/intl.dart';

String formatDollarBalance(String balance, {bool noShowNaira = false}) {
  // Convert the balance string to a double
  final balanceValue = double.tryParse(balance);

  if (balanceValue != null) {
    // Create a NumberFormat instance with the desired formatting
    final formatter = NumberFormat.currency(
      symbol: !noShowNaira
          ? '₦'
          : '\$', // Set the currency symbol if needed (e.g., '$')
      decimalDigits: 0, // Set the number of decimal places
    );

    // Format the balance value
    final formattedBalance = formatter.format(balanceValue);

    return formattedBalance;
  }

  // Return the original balance string if it couldn't be parsed as a double
  return balance;
}
