import 'dart:convert';
import '/makmachpages/models/computer_model.dart';
import 'package:http/http.dart' as http;
import '../../global_config.dart';

Future<List<ComputerModel>> getComputer() async {
  String url = "${apiUrl}getComputer";
  print(url);
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  var res = await http.get(Uri.parse(url), headers: headers);

  print(headers);
  print(res.statusCode);
  if (res.statusCode == 200) {
    final data = jsonDecode(res.body);
    print("res ${res.body}");
    return List<ComputerModel>.from(
      data.map((item) {
        return ComputerModel.fromJson(item); // convert json to object
      }),
    );
  }
  return [];
}
