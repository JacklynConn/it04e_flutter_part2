import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_part2/global_config.dart';
import 'package:flutter_part2/src/models/category_model.dart';
import 'package:flutter_part2/src/models/product_model.dart';
import 'package:flutter_part2/src/repository/product_repository.dart'
    as productRepo;

import 'inner_screen/product_detail.dart';

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
  final TextEditingController _searchController = TextEditingController();

  bool showListView = false;
  bool showLoading = false;
  String textSearch = "";
  String category_id = "";
  List<ProductModel> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category_id = widget.data.id.toString();
    initListProduct();
  }

  initListProduct() {
    setState(() {
      showLoading = true;
    });
    productRepo.getListProductByCategory(category_id).then((response) {
      setState(() {
        showLoading = false;
        productList = response;
      });
    });
  }

  searchProduct() {
    setState(() {
      showLoading = true;
    });
    productRepo.getSearchListProduct(category_id, textSearch).then((response) {
      setState(() {
        showLoading = false;
        productList = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.data.name}",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade200,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    textSearch = value;
                  });
                  if (value.isEmpty) {
                    initListProduct();
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  isDense: true,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  suffix: IconButton(
                    onPressed: () {
                      searchProduct();
                    },
                    icon: const Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
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
              color: Colors.grey.shade200,
              child: showLoading
                  ? const Center(child: CircularProgressIndicator())
                  : productList.isEmpty
                      ? const Center(child: Text("No Products"))
                      : showListView
                          ? ListView.builder(
                              itemCount: productList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                          data: productList[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: SizedBox(
                                      height: 100,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.infinity,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '$apiBaseUrl${productList[index].images}',
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                    right: 20,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${productList[index].productName}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        "\$ ${productList[index].price}",
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                IconButton.filled(
                                                  style: ButtonStyle(
                                                    minimumSize:
                                                        MaterialStateProperty
                                                            .all(
                                                      const Size(20, 20),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.add_shopping_cart,
                                                    size: 15,
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
                              },
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                ),
                                itemCount: productList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                            data: productList[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 200,
                                                width: 200,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$apiBaseUrl${productList[index].images}',
                                                  fit: BoxFit.cover,
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "${productList[index].productName}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "\$ ${productList[index].price} ",
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: IconButton.filled(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.add_shopping_cart,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
            ),
          ),
        ],
      ),
    );
  }
}
