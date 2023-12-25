import 'package:flutter/material.dart';
import 'package:flutter_part2/src/elements/category_element.dart';
import 'package:flutter_part2/src/elements/home_slide_element.dart';
import '../repository/user_repository.dart' as userRopo;
import 'login1.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    double wScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Pages", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade200,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.pink,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/1.jpg"),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${userRopo.current_user.value.firstName} ${userRopo.current_user.value.lastName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${userRopo.current_user.value.phone}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${userRopo.current_user.value.email}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                userRopo.logout().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login1()));
                });
              },
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow.shade200,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const HomeSlideElement(),
              Expanded(
                child: ListView(
                  children: [
                    CategoryElement(),
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
