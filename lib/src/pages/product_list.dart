import 'package:flutter/material.dart';
import 'package:flutter_part2/global_config.dart';
import 'package:flutter_part2/src/models/category_model.dart';

class ProductList extends StatefulWidget {
    const ProductList({
    super.key,
    required this.data,
  });

  final CategoryModel data;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool showListView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.data.Name}"),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade200,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 30,
              child: Row(
                children: [
                  const Text(
                    "Product List",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.grid_view),
                  // ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        showListView = !showListView;
                      });
                    },
                    icon: showListView
                        ? const Icon(Icons.grid_view)
                        : const Icon(Icons.list),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: showListView
                  ? ListView(
                      children: [
                        Card(
                          child: SizedBox(
                            height: 90,
                            child: ListTile(
                              leading: SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(
                                      '$apiBaseUrl${widget.data.images}'),
                                ),
                              ),
                              title: Text("${widget.data.Name}"),
                              subtitle: Text("${widget.data.Code}"),
                              trailing: const Text(
                                "\$ 100",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(
                                      '$apiBaseUrl${widget.data.images}'),
                                ),
                              ),
                              Text("${widget.data.Name}"),
                              Text("${widget.data.Code}"),
                              const Text(
                                "\$ 100",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
