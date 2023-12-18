import 'dart:convert';

import '/src/repository/user_repository.dart' as userRopo;
import 'package:http/http.dart' as http;
import '/src/models/category_model.dart';
import '../../global_config.dart';

Future<List<CategoryModel>> getCategory() async{
  String url = apiUrl + "category";
  print(url);
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${userRopo.current_user.value.api_token!}',
  };

  var res = await http.get(
    Uri.parse(url),
    headers: headers
  );

  print(headers);
  var data;
  print(res.statusCode);
  if(res.statusCode == 200){

   final  data = jsonDecode(res.body);
   print("res ${res.body}");
    return List<CategoryModel>.from(
      data.map((item){
        return CategoryModel.fromJson(item); // convert json to object
      }),
    );
  }
  return [];
}