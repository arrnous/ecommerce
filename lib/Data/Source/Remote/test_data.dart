import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class TestData {
  DbFunctions crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
