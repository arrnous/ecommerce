import 'package:ecommerce/Core/Class/db_functions.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {
  DbFunctions crud;

  FavoriteData(this.crud);

  addFav(String custid, String proid) async {
    var response = await crud.postData(AppLink.addFav, {
      "custid": custid,
      "proid": proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFav(String custid, String proid) async {
    var response = await crud.postData(AppLink.removeFav, {
      "custid": custid,
      "proid": proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewFavorite(String custid) async {
    var response = await crud.postData(AppLink.favoriteView, {
      "id": custid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String favid) async {
    var response = await crud.postData(AppLink.deleteFav, {
      "id": favid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
