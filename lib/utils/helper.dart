import 'dart:math' as math;

class Helper {
  static String getTokenFromString({String str}) {
    String temp = str;
    List<String> _replaceList = ["x", "÷", "π", "√", "sec", "cosec", "cot"];
    _replaceList.forEach((element) {
      temp = temp.replaceAll(element, _replaceSwitch(element));
    });
    return temp;
  }

  static String _replaceSwitch(String str) {
    switch (str) {
      case "x":
        return "*";
      case "√":
        return "sqrt";
      case "π":
        return math.pi.toString();
      case "÷":
        return "/";
      case "sec":
        return "arccos";
      case "cosec":
        return "arcsin";
      case "cot":
        return "arctan";
      default:
        return str;
    }
  }
}
