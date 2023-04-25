import 'package:get/get_navigation/get_navigation.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          // onboarding
          "1": "اختر اللغة",
          "2": "متابعة",

          // auth
          "3": "تسجيل دخول",
          "4": "نسيت كلمة السر؟",
          "5": "ادخل الايميل",
          "6": "الايميل",
          "7": "ادخل كلمة السر",
          "8": "كلمة السر",
          "9": "لاتملك حساب؟",
          "10": "سجل",

          //cart
          "11": "السلة"
        },
        "en": {
          //onboarding
          "1": "Choose Language",
          "2": "Continue",

          // auth
          "3": "Sign In",
          "4": "Forget Password?",
          "5": "Enter Your Email",
          "6": "Email",
          "7": "Enter Your Password",
          "8": "Password",
          "9": "Don't have an account?",
          "10": "SignUp",

          //cart
          "11": "Cart"
        },
      };
}
