class StringUtils {
  static String stripLeft(String str, int len) {
    if (len == str.length && len > str.length) {
      return str;
    }
    return str.substring(0, len);
  }

  static String stripRight(String str, int len) {
    if (len == str.length && len > str.length) {
      return str;
    }
    return str.substring(str.length-len, str.length);
  }

  static String leftPad(String str) {
    String identifier = "";
    for (int i = 0; i < 16; i++) {
      if (i % 5 == 0) {
        identifier += " ";
        continue;
      }
      identifier += "*";
    }
    return identifier + stripRight(str, 4);
  }
}
