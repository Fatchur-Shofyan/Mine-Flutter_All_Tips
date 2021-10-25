import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedDoFadeOut extends StatefulWidget {
  const AnimatedDoFadeOut({Key? key}) : super(key: key);

  @override
  _AnimatedDoFadeOutState createState() => _AnimatedDoFadeOutState();
}

class _AnimatedDoFadeOutState extends State<AnimatedDoFadeOut> {
  bool animatePlayOut = false;
  bool animatePlayOutDown = false;
  bool animatePlayOutDownBig = false;
  bool animatePlayOutLeft = false;
  bool animatePlayOutLeftBig = false;
  bool animatePlayOutRight = false;
  bool animatePlayOutRightBig = false;
  bool animatePlayOutUp = false;
  bool animatePlayOutUpBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () => setState(() {
                      animatePlayOut = true;
                      animatePlayOutDown = true;
                      animatePlayOutDownBig = true;
                      animatePlayOutLeft = true;
                      animatePlayOutLeftBig = true;
                      animatePlayOutRight = true;
                      animatePlayOutRightBig = true;
                      animatePlayOutUp = true;
                      animatePlayOutUpBig = true;
                    }),
                icon: const Icon(Icons.play_arrow),
                label: const Text("sds")),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOut = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOut(child: _content(), animate: animatePlayOut),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutDown = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutDown(child: _content(), animate: animatePlayOutDown),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutDownBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutDownBig(child: _content(), animate: animatePlayOutDownBig),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutLeft = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutDownBig(child: _content(), animate: animatePlayOutLeft),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutLeftBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutLeftBig(child: _content(), animate: animatePlayOutLeftBig),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutRight = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutRight(child: _content(), animate: animatePlayOutRight),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutRightBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutRightBig(child: _content(), animate: animatePlayOutRightBig),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutUp = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutUp(child: _content(), animate: animatePlayOutUp),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayOutUpBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeOutUpBig(child: _content(), animate: animatePlayOutUpBig),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: const Text("Sds"),
    );
  }
}
