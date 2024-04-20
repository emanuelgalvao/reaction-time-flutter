class TimeFormatter {

  static String format(int time) {
    String milliseconds = (time % 1000).toString().padLeft(3, "0");
    String seconds = ((time ~/ 1000) % 60).toString().padLeft(2, "0");
    return "$seconds:$milliseconds";
  }
}