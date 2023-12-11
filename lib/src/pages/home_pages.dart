import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Pages"),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "${userRopo.current_user.value.phone}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    "${userRopo.current_user.value.email}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
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
      body: Container(),
    );
  }
}
