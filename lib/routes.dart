import 'package:ecommerce/Core/Constant/routes.dart';
import 'package:ecommerce/View/Screen/address/add.dart';
import 'package:ecommerce/View/Screen/address/addlocation.dart';
import 'package:ecommerce/View/Screen/address/view.dart';
import 'package:ecommerce/View/Screen/auth/checkemail.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/forgetpass.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/verifycodesignup.dart';
import 'package:ecommerce/View/Screen/auth/login.dart';
import 'package:ecommerce/View/Screen/auth/signup.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/success_resetpass.dart';
import 'package:ecommerce/View/Screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce/View/Screen/cart/cart.dart';
import 'package:ecommerce/View/Screen/checkout/checkout.dart';
import 'package:ecommerce/View/Screen/onboarding.dart';
import 'package:ecommerce/View/Screen/product/prodetails.dart';
import 'package:get/get.dart';
import 'Core/Middleware/mymiddleware.dart';
import 'View/Screen/auth/forgetpassword/resetpassoword.dart';
import 'View/Screen/auth/success_signup.dart';
import 'View/Screen/favorite/myfavorite.dart';
import 'View/Screen/language.dart';
import 'View/Screen/home/homescreen.dart';
import 'View/Screen/product/product.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => const TestView()),
  // onboarding
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),

  // Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoute.successResetPass, page: () => const SuccessResetPass()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.checkEmail, page: () => const CheckEmail()),

  // Home
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),

  // product
  GetPage(name: AppRoute.product, page: () => const Product()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),

  //favorite
  GetPage(name: AppRoute.myFavortie, page: () => const MyFavorite()),

  //  cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  // address
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(
      name: AppRoute.addressAddLocation,
      page: () => const AddressAddLocation()),
  GetPage(name: AppRoute.addressAdd, page: () => const AddressAdd()),
  //GetPage(name: AppRoute.addressEdit, page: () => const AddressEdit()),

  //checkout
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
];









/* 


Map<String, Widget Function(BuildContext)> routesMain = {
  // Auth
  AppRoute.onboarding: (context) => const Onboarding(),
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.successResetPass: (context) => const SuccessResetPass(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.checkEmail: (context) => const CheckEmail(),
  AppRoute.verifyCodeSignUp: (context) => const VerifyCodeSignUp(),
}; */
