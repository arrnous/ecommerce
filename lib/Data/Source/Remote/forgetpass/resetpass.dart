import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class ResetPassData {
  DbFunctions crud;

  ResetPassData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPass, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
