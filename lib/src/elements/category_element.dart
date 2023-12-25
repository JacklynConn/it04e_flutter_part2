import 'package:flutter/material.dart';
import 'package:flutter_part2/global_config.dart';
import 'package:flutter_part2/src/pages/list_motor_page.dart';
import '../models/category_model.dart';
import '../repository/category_repository.dart' as categoryRepo;

class CategoryElement extends StatefulWidget {
  const CategoryElement({super.key});

  @override
  State<CategoryElement> createState() => _CategoryElementState();
}

class _CategoryElementState extends State<CategoryElement> {
  List<CategoryModel> catList = [];
  bool show_data = true;

  @override
  initState() {
    super.initState();
    categoryRepo.getCategory().then((response) {
      setState(() {
        show_data = false;
        catList = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      child: Card(
        elevation: 1,
        child: show_data
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: catList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return _buildGridView(
                    catList[index],
                  );
                },
              ),
      ),
    );
  }

  Widget _buildGridView(CategoryModel item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListMotorPage(cat: item)));
      },
      child: Card(
        color: Colors.yellow.shade200,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                  // width: 50,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network('$apiBaseUrl${item.images}'),
                  ),
                ),
                Text(
                  "${item.Name}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "${item.Code}",
                  style: const TextStyle(
                    color: Colors.blueAccent,
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
