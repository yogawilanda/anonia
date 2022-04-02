import 'package:jiffy/jiffy.dart';

class LocalDates extends DateTime {
  LocalDates(int year) : super(year);

  final DateTime currentTime = DateTime.now();

  final DateTime timeAgo = DateTime.now().subtract(const Duration(days: 50));
}

class LocalWithJiffy extends Jiffy {}
