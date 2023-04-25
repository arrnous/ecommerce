import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class CheckEmailData {
  DbFunctions crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEamil, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
