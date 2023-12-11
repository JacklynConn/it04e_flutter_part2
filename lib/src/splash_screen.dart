import 'package:flutter/material.dart';
import 'package:flutter_part2/src/pages/home_pages.dart';
import 'package:flutter_part2/src/pages/login1.dart';
import '../src/repository/user_repository.dart' as userRepo;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }
  void init() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (userRepo.current_user.value.api_token != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePages()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login1()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
