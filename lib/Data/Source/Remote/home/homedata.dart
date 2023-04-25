import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class HomeData {
  DbFunctions crud;

  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
