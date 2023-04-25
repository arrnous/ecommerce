import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeSignUpData {
  DbFunctions crud;

  VerifyCodeSignUpData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response = await crud.postData(AppLink.resendCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
