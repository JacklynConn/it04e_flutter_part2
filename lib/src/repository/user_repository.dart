import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_part2/global_config.dart';
import 'package:flutter_part2/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<UserModel> current_user = new ValueNotifier(UserModel());

Future register(UserModel userModel) async {
  String url = apiUrl + "Register";

  var headers = {
    'Content-Type': 'application/json',
  };

  var res = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(userModel.toJson()),
  );

  var data = res.body;
  if (res.statusCode == 200) {
    var result = jsonDecode(data)['data'];
    setCurrentUser(jsonEncode(result)); // save user to shared preferences
    current_user.value = UserModel.fromJson(result);
    return current_user.value;
  }
  return userModel.message = "FAIL";
}

Future Login(UserModel userModel) async {
  String url = apiUrl + "login";
  print(url);
  print(jsonEncode(userModel.toJson()));
  var headers = {
    'Content-Type': 'application/json',
  };

  var res = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(userModel.toJson()),
  );

  var data = res.body;
  print(data);
  if (res.statusCode == 200) {
    var result = jsonDecode(data)['data'];
    setCurrentUser(jsonEncode(result));
    current_user.value = UserModel.fromJson(result);
    return current_user.value;
  }
  return userModel.message = "FAIL";
}

Future<UserModel> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userPref = prefs.get("ntr_current_user");// get user from shared preferences
  current_user.value = UserModel.fromJson(json.decode(userPref.toString())); // set user to value notifier
  current_user.notifyListeners();
  return current_user.value; // return user
}

void setCurrentUser(jsonString) async { // save user to shared preferences
  try {
    if (json.decode(jsonString) != null) { // check if user is not null
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString( // save user to shared preferences
          'ntr_current_user', json.encode(json.decode(jsonString)));
      print(prefs.getString("ntr_current_user")); // print user from shared preferences
    }
  } catch (e) {
    print(e);
  }
}

Future<void> logout() async {
  current_user.value = UserModel();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("ntr_current_user");
}
