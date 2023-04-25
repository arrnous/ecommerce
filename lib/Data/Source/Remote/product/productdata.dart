import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class ProductData {
  DbFunctions crud;

  ProductData(this.crud);

  getData(String id, String custid) async {
    var response =
        await crud.postData(AppLink.product, {"id": id, "cust_id": custid});
    return response.fold((l) => l, (r) => r);
  }
}
