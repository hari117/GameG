class StringUtil {
  bool isEmpty(String value) {
    return !isPresent(value);
  }

  isPresent(String value) {
    if (value != null && value != "") {
      return true;
    }
    return false;
  }
}

final $stringUtil = StringUtil();