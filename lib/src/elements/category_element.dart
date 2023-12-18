import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../repository/category_repository.dart' as categoryRepo;

class CategoryElement extends StatefulWidget {
  const CategoryElement({super.key});

  @override
  State<CategoryElement> createState() => _CategoryElementState();
}

class _CategoryElementState extends State<CategoryElement> {
  List<CategoryModel> catList = [];

  @override
  initState() {
    super.initState();
    categoryRepo.getCategory().then((value) {
      setState(() {
        catList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Colors.blue,
    );
  }
}
