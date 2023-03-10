class SupportApp {}

/// For Example 2022-08-21
String myCustomDateTimeYYYYMMDD() {
  String year = DateTime.now().year.toString();
  late String month;
  if (DateTime.now().month < 10) {
    month = "0${DateTime.now().month}";
  } else {
    month = DateTime.now().month.toString();
  }
  late String day;
  if (DateTime.now().day < 10) {
    day = "0${DateTime.now().day}";
  } else {
    day = DateTime.now().day.toString();
  }
  return "$year-$month-$day";
}

/// For Example 01:09
String myCustomDateTimeHHMM() {
  late String hour;
  if (DateTime.now().hour < 10) {
    hour = "0${DateTime.now().hour.toString()}";
  } else {
    hour = DateTime.now().hour.toString();
  }
  late String minute;
  if (DateTime.now().minute < 10) {
    minute = "0${DateTime.now().minute.toString()}";
  } else {
    minute = DateTime.now().minute.toString();
  }
  return "$hour:$minute";
}

String getDateWithHrs(DateTime time) {
  int hour = time.hour;
  if (hour > 12) {
    hour -= 12;
  }
  return "${time.year}/${time.month}/${time.day}   ${hour.toString().padLeft(2, "0")} : ${time.minute.toString().padLeft(2, '0')}";
}

String getDate(DateTime time) {
  int hour = time.hour;
  if (hour > 12) {
    hour -= 12;
  }
  return "${time.year}/${time.month}/${time.day}";
}
