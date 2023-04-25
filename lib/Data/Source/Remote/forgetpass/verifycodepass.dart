import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodePassData {
  DbFunctions crud;

  VerifyCodePassData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodePass, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
