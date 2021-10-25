import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough(
      {Key? key,
      required this.title,
      required this.content,
      required this.imageIcon,
      this.imagecolor = Colors.redAccent})
      : super(key: key);

  final String title;
  final String content;
  final IconData imageIcon;
  final Color imagecolor;

  @override
  WalkthroughState createState() {
    return WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        animationDuration: const Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: Text(widget.content,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.black)),
            ),
            Icon(
              widget.imageIcon,
              size: 100.0,
              color: widget.imagecolor,
            )
          ],
        ),
      ),
    );
  }
}
