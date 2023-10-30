import 'package:flutter/material.dart';
import 'package:flutter_part2/src/widgets/background_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BackgroundWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
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
                                labelText: "User Name",
                                prefixIcon: Icon(Icons.account_circle),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
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
                                labelText: "Password",
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
                        child: const Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
