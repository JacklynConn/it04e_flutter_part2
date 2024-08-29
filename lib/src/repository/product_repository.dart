import '../../global_config.dart';
import '../models/product_model.dart';
import 'user_repository.dart' as userRopo;
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<ProductModel>> getListProductByCategory(String categoryId) async {
  String url = "${apiUrl}product";

  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${userRopo.current_user.value.access_token!}',
  };

  var res = await http.get(
    Uri.parse(url),
    headers: headers,
  );

  // print(headers);
  // print(res.statusCode);
  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    List<ProductModel> productList = [];
    for (var item in data['data']) {
      if (item['CategoryId'] == categoryId) {
        productList.add(ProductModel.fromJson(item));
      }
    }
    return productList;
  }
  return [];
}

Future<List<ProductModel>> getSearchListProduct(
    String categoryId, String search) async {
  String url = "${apiUrl}product?category_id=$categoryId&search=$search";

  // print(url);
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${userRopo.current_user.value.access_token!}',
  };

  var res = await http.get(
    Uri.parse(url),
    headers: headers,
  );

  // print(headers);
  // print(res.statusCode);
  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    List<ProductModel> productList = [];
    for (var item in data['data']) {
      if (item['CategoryId'] == categoryId &&
          item['ProductName'].toLowerCase().contains(search.toLowerCase())) {
        productList.add(ProductModel.fromJson(item));
      }
    }
    return productList;
  }
  return [];
}
