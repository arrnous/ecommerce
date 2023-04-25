import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return " can't be Empty";
  }

  if (val.length < min) {
    return " can't be less than $min";
  }

  if (val.length > max) {
    return " can't be larger than $max";
  }

  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  } else if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  } else if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }
}
