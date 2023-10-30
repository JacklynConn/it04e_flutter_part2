import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  Widget child;
  BackgroundWidget({super.key, required this.child});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen =  MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthScreen,
      height: heightScreen,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            // color: Colors.red,
            child: Image.asset("assets/images/top2.png"),
          ),
          Positioned(
            top: 0,
            child: Image.asset("assets/images/top1.png"),
          ),
          Positioned(
            right: 0,
            child: Image.asset("assets/images/2.png", height: 125,),
          ),
          Positioned(
            bottom: 0,
            // color: Colors.red,
            child: Image.asset("assets/images/bottom2.png"),
          ),
          Positioned(
            bottom: 0,
            // color: Colors.red,
            child: Image.asset("assets/images/bottom1.png"),
          ),
          widget.child,
        ],
      )
    );
  }
}
