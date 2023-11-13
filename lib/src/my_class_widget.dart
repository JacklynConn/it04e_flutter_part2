import 'package:flutter/material.dart';

class MyClassWidget extends StatefulWidget {
  double width;
  double height;
  Alignment alignment;
  final Color? color;
  // final Decoration? decoration;
  BorderRadius? borderRadius;
  MyClassWidget({
    super.key,
    this.width = 500,
    required this.height,
    required this.alignment,
    this.color,
    required Widget child,
    // this.decoration,
    this.borderRadius,
  });

  @override
  State<MyClassWidget> createState() => _MyClassWidgetState();
}

class _MyClassWidgetState extends State<MyClassWidget> {
  @override
  Widget build(BuildContext context) {
    // if(widget.borderRadius == null){
    //   widget.borderRadius = BorderRadius.all(Radius.circular(50));
    // }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              alignment: widget.alignment,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: widget.borderRadius ??
                    const BorderRadius.all(
                      Radius.circular(40),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
