import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          child: Image.asset("assets/images/top1.png"),
        ),
        Positioned(
          right: 0,
          child: Image.asset("assets/images/2.png"),
        ),
        Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
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
                        decoration: InputDecoration(
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              color: Color(0xFFDDDDDD),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              color: Color(0xFFDDDDDD),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    Text("Incorrect email or password", style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          // color: Colors.red,
          child: Image.asset("assets/images/bottom2.png"),
        ),
      ],
    ));
  }
}
