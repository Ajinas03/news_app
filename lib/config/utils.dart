import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  String classifyTemperature(double fahrenheit) {
    if (fahrenheit < 50) {
      // cold
      return 'Depressing';
    } else if (fahrenheit >= 50 && fahrenheit < 70) {
      // cool
      return 'Fear';
    } else {
      // hot
      return 'Winning And Happiness';
    }
  }

  Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  static String formatEpochToDay(int epochTimestamp) {
    // Convert epoch to DateTime
    final DateTime date =
        DateTime.fromMillisecondsSinceEpoch(epochTimestamp * 1000);

    // Create a formatter for the day (e.g., Mon)
    final DateFormat dayFormatter = DateFormat('E');

    // Create a formatter for the date (e.g., 12)
    final DateFormat dateFormatter = DateFormat('d');

    // Format the date
    final String day = dayFormatter.format(date);
    final String dateNum = dateFormatter.format(date);

    // Combine day and date
    return '$day $dateNum';
  }
}
