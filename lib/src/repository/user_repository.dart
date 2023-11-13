import 'package:flutter_part2/global_config.dart';
import 'package:flutter_part2/src/models/user_model.dart';
import 'package:http/http.dart' as http;

Future register(UserModel userModel) async {
  String url = apiBaseUrl + "register";

  var headers = {
    'Content-Type': 'application/json',
  };

  var res = await http.post(
    Uri.parse(url),
    headers: headers,
    body: userModel.toJson(),
  );

  var data = res.body;
  print(data);
}
