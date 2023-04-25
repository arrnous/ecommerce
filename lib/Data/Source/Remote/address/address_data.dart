import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class AddressData {
  DbFunctions crud;

  AddressData(this.crud);

  getData(String custid) async {
    var response = await crud.postData(AppLink.viewAddress, {
      "custid": custid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String custid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addAddress, {
      "custid": custid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData(String addid) async {
    var response = await crud.postData(AppLink.removeAddress, {
      "addid": addid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
