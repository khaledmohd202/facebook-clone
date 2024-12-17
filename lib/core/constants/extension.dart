import 'package:jiffy/jiffy.dart';

extension FormatDate on DateTime {
  String yMMMED() => Jiffy.parseFromDateTime(this).yMMMEd;
}

extension FormatDate2 on DateTime {
  String jm() => Jiffy.parseFromDateTime(this).jm;
}

extension FromNow on DateTime {
  String fromNow() => Jiffy.parseFromDateTime(this).fromNow();
}
