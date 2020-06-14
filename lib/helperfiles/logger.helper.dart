import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}

class SimpleLogPrinter extends LogPrinter {
  String _className;
  SimpleLogPrinter(this._className);
  @override
  List<String> log(LogEvent logEvent) {
    var now = new DateTime.now();
    var formatter = DateFormat('Hms');
    String formatted = formatter.format(now);
    var level = logEvent.level;
    var emoji = PrettyPrinter.levelEmojis[level];
    return ['[$formatted] [${_className.padLeft(20, " ")} ] $emoji - ${logEvent.message}'];
  }
}
