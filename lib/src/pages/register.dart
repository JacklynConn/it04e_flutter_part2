import 'package:flutter/material.dart';
import 'package:flutter_part2/src/models/user_model.dart';
import 'package:flutter_part2/src/pages/login1.dart';
import '../widgets/background_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? password;
  String? address;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BackgroundWidget(
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    firstName = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "First Name",
                                  prefixIcon: Icon(Icons.account_circle),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  lastName = value;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "Last Name",
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  phone = value;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "Phone",
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  address = value;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "Address",
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            Text(
                              "Incorrect email or password",
                              style: TextStyle(color: Colors.red),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.yellow,
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                               print(firstName);
                                print(lastName);
                                print(phone);
                                print(email);
                                print(password);
                                print(address);

                                var objUser = UserModel(
                                  firstName: firstName,
                                  lastName: lastName,
                                  phone: phone,
                                  email: email,
                                  password: password,
                                  address: address,
                                );

                                print(objUser.toJson());
                                setState(() {

                                });
                              },
                              child: const Text("Login", style: TextStyle(color: Colors.blue, fontSize: 12),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
