import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/home_slide_model.dart';

class HomeSlideElement extends StatefulWidget {
  const HomeSlideElement({super.key});

  @override
  State<HomeSlideElement> createState() => _HomeSlideElementState();
}

class _HomeSlideElementState extends State<HomeSlideElement> {

  List<HomeSliderModel> arrSliderModel = [
    HomeSliderModel(
      id: 1,
      title: "Title 1",
      image: "https://th.bing.com/th/id/R.cb7e3a7103f1f6416ae37dbf6ec1bc56?rik=JeFlt6x%2bc77BSw&pid=ImgRaw&r=0",
      description: "Description 1",
    ),
    HomeSliderModel(
      id: 2,
      title: "Title 2",
      image: "https://th.bing.com/th/id/OIP.EiDC9C_YLIrzINgbQkxicwHaE8?rs=1&pid=ImgDetMain",
      description: "Description 2",
    ),
    HomeSliderModel(
      id: 3,
      title: "Title 3",
      image: "https://th.bing.com/th?id=OPHS.lygV5PAynYrxRw474C474&w=592&h=550&o=5&dpr=1.3&pid=21.1",
      description: "Description 3",
    ),
    HomeSliderModel(
      id: 4,
      title: "Title 4",
      image: "https://th.bing.com/th/id/OIP.LOndYTb_Ti6rucCMmGUy6gHaFj?w=1280&h=960&rs=1&pid=ImgDetMain",
      description: "Description 4",
    ),
    HomeSliderModel(
      id: 5,
      title: "Title 5",
      image: "https://th.bing.com/th/id/OIP.uhHgbqkqcPwo9XfhO_Fg0AAAAA?rs=1&pid=ImgDetMain",
      description: "Description 5",
    ),
  ];

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 226,
      width: double.infinity,
      // color: Colors.white,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: arrSliderModel.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CachedNetworkImage(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: "${arrSliderModel[itemIndex].image}",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
