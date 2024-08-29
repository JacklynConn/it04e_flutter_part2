import 'package:flutter/material.dart';
import 'package:flutter_part2/global_config.dart';
import 'package:flutter_part2/src/models/product_model.dart';
import 'package:expandable_text/expandable_text.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.data});

  final ProductModel data;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.data.productName}",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow.shade200,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.network(
                "$apiBaseUrl${widget.data.images}",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ExpandableText(
                      "${widget.data.productName}.",
                      expandText: 'read more',
                      collapseText: 'read less',
                      linkColor: Colors.blue,
                      animation: true,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        // color: Colors.blue
                      ),
                    ),
                  ),
                  Text(
                    "\$${widget.data.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: kBottomNavigationBarHeight - 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  IconButton.filled(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(32, 32),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.blue,
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("${widget.data.description}"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
