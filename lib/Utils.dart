class Utils {
  static String dateTimeToString(DateTime date, String format) {
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString().padLeft(4, '0');
    String hour = date.hour.toString().padLeft(2, '0');
    String second = date.minute.toString().padLeft(2, '0');
    if (format == 'dd/MM/yyyy')
      return '$day/$month/$year';
    else if (format == 'MM/dd/yyyy')
      return '$month/$day/$year';
    else
      return date.toString();
  }
}
