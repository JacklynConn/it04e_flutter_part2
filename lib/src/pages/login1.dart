import 'package:flutter/material.dart';
import 'package:flutter_part2/src/models/user_model.dart';
import '../widgets/background_widget.dart';
import 'home_pages.dart';
import '../repository/user_repository.dart' as userRepo;

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Form(
                          key: loginForm,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  // controller: _emailController,

                                  onSaved: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please input email";
                                    }
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
                                    prefixIcon: Icon(Icons.account_circle),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  // controller: _passwordController,
                                  onSaved: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please input password";
                                    }
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
                      ),
                      GestureDetector(
                        onTap: () {
                          // var objUser = UserModel(
                          //     // email: _emailController.text,
                          //     // password: _passwordController.text,
                          //     );

                          // print(_emailController.text);
                          // print(_passwordController.text);

                          if (loginForm.currentState!.validate()) {
                            loginForm.currentState!.save();
                            var userObj =
                                UserModel(email: email, password: password);
                            userRepo.Login(userObj).then((res) {
                              print(res);
                              if (res.message != "FAIL") {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HomePages(),
                                  ),
                                );
                              }
                            });
                          }
                        },
                        child: Padding(
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
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text("Don't have an account?"),
                          ),
                        ],
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
