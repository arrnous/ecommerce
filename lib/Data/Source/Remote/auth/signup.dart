import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class SignUpData {
  DbFunctions crud;

  SignUpData(this.crud);

  postData(String username, String passowrd, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": passowrd,
      "email": email,
      "phone": phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
