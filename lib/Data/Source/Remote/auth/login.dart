import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class LoginData {
  DbFunctions crud;

  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
