import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/global_config.dart';
import '/makmachpages/pages/detail_product_computer.dart';
import '../models/computer_model.dart';
import '../repository/computer_repository.dart' as computerRepo;

class ComputerPages extends StatefulWidget {
  const ComputerPages({super.key});

  @override
  State<ComputerPages> createState() => _ComputerPagesState();
}

class _ComputerPagesState extends State<ComputerPages> {
  List<ComputerModel> computerList = [];
  bool showData = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    computerRepo.getComputer().then((response) {
      setState(() {
        showData = false;
        computerList = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Computer"),
      ),
      body: ListView.builder(
          itemCount: computerList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailProductComputer(data: computerList[index]),
                    ),
                  );
                },
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CachedNetworkImage(
                          imageUrl: "$apiBaseUrl${computerList[index].imges!}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${computerList[index].computerName}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Text(
                                "${computerList[index].price}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
