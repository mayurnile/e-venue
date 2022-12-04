import "package:intl/intl.dart";

extension DateTimeExtension on DateTime {
  /// Formats the [DateTime] object of [dateOfBirth]
  /// into the format required to be displayed in the UI
  /// For eg. Feb 20, 2000
  String get dateOfBirthUIFormat => DateFormat("MMM d, y").format(this);

  /// Formats the [DateTime] object of [dateOfBirth]
  /// into the format required to be stored on db
  // String get dateOfBirthAPIFormat => toIso8601String();
  String get dateOfBirthAPIFormat => DateFormat("M/d/y").format(this);

  /// Checks wether the selected [dateOfBirth]
  /// is above 16 years or not
  bool get isAtLeast16YearsOld => DateTime.now().difference(this) > const Duration(days: 16 * 365);

  /// To get timezone is format required by API
  /// For eg. 5:30
  /// For eg. -4:30
  String get timezoneOffsetAPIFormat {
    final Duration timezoneOffset = timeZoneOffset;
    if (timeZoneOffset.isNegative) {
      return timezoneOffset.toString().substring(0, 5);
    } else {
      return timezoneOffset.toString().substring(0, 4);
    }
  }

  // To get date in format required b y UI
}
