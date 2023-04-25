import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class SearchData {
  DbFunctions crud;

  SearchData(this.crud);

  searchData(String search) async {
    var response = await crud.postData(AppLink.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
