import 'package:flutter/material.dart';
import '../my_class_widget.dart';

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
        child: MyClassWidget(
          alignment: Alignment.center,
          width: 200,
          height: 200,
           color: Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
        ),
        ),
      ),
    );
  }
}
