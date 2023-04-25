import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/Core/Class/statusrequest.dart';
import 'package:ecommerce/Core/Functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class DbFunctions {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var respose = await http.post(Uri.parse(url), body: data);
        if (respose.statusCode == 200 || respose.statusCode == 201) {
          Map result = jsonDecode(respose.body);
          print(respose);
          return right(result);
        } else {
          return left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return left(StatusRequest.serverException);
    }
  }
}
