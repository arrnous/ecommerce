class AppLink {
  static const String server = "https://marnous.com/ecommerce";

  static const String test = "$server/test.php";

  // images
  static const String imageCat = "$server/images/category/";
  static const String imagePro = "$server/images/product/";

  // auth
  static const String signUp = "$server/api/auth/signup.php";
  static const String login = "$server/api/auth/login.php";
  static const String verifyCodeSignUp = "$server/api/auth/verifycode.php";

  // Forget Password
  static const String checkEamil = "$server/api/auth/forgetpass/checkemail.php";
  static const String resetPass = "$server/api/auth/forgetpass/resetpass.php";
  static const String verifyCodePass =
      "$server/api/auth/forgetpass/verifycodepass.php";
  static const String resendCode = "$server/api/auth/forgetpass/resendcode.php";

  // Home
  static const String home = "$server/api/home/home.php";

  // products
  static const String product = "$server/api/product/product.php";
  static const String search = "$server/api/product/search.php";

  // favorite
  static const String addFav = "$server/api/favorite/addfav.php";
  static const String removeFav = "$server/api/favorite/removefav.php";
  static const String favoriteView = "$server/api/favorite/view.php";
  static const String deleteFav = "$server/api/favorite/delete.php";

  // cart
  static const String addCart = "$server/api/cart/addcart.php";
  static const String removeCart = "$server/api/cart/removecart.php";
  static const String cartView = "$server/api/cart/view.php";
  static const String geCount = "$server/api/cart/count.php";

  // address
  static const String addAddress = "$server/api/address/add.php";
  static const String viewAddress = "$server/api/address/view.php";
  static const String editAddress = "$server/api/address/edit.php";
  static const String removeAddress = "$server/api/address/remove.php";

  //coupon
  static const String checkCoupon = "$server/api/coupon/checkcoupon.php";
}
