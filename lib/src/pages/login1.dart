import 'package:flutter/material.dart';
import 'package:flutter_part2/src/models/user_model.dart';
import 'package:flutter_part2/src/pages/register.dart';
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
  bool isPassword = true;

  void togglePassword() {
    setState(() {
      isPassword = !isPassword;
    });
  }

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
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: loginForm,
                          child: Column(
                            children: [
                              TextFormField(
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
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  // isDense: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "Email",
                                  prefixIcon: Icon(Icons.account_circle),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                obscureText: isPassword,
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
                                  return null;
                                },
                                decoration: InputDecoration(
                                  // isDense: true,
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    borderSide: BorderSide(
                                      color: Color(0xFFDDDDDD),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    onPressed: togglePassword,
                                    icon: Icon(
                                      isPassword
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                onPressed: () {
                                  if (loginForm.currentState!.validate()) {
                                    loginForm.currentState!.save();
                                    var userObj = UserModel(
                                      email: email,
                                      password: password,
                                    );
                                    userRepo.login(userObj).then((res) {
                                      print(res);
                                      if (res.message != "FAIL") {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePages(),
                                          ),
                                        );
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // var objUser = UserModel(
                      //     //     // email: _emailController.text,
                      //     //     // password: _passwordController.text,
                      //     //     );
                      //
                      //     // print(_emailController.text);
                      //     // print(_passwordController.text);
                      //     if (loginForm.currentState!.validate()) {
                      //       loginForm.currentState!.save();
                      //       var userObj = UserModel(
                      //         email: email,
                      //         password: password,
                      //       );
                      //       userRepo.login(userObj).then((res) {
                      //         print(res);
                      //         if (res.message != "FAIL") {
                      //           Navigator.of(context).push(
                      //             MaterialPageRoute(
                      //               builder: (context) => const HomePages(),
                      //             ),
                      //           );
                      //         }
                      //       });
                      //     }
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Container(
                      //       alignment: Alignment.center,
                      //       width: double.infinity,
                      //       height: 50,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(50),
                      //         color: Colors.yellow,
                      //       ),
                      //       child: const Text(
                      //         "Login",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
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
