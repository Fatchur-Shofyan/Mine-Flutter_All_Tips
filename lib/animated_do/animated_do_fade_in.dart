import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedDoFadeIn extends StatefulWidget {
  const AnimatedDoFadeIn({Key? key}) : super(key: key);

  @override
  _AnimatedDoFadeInState createState() => _AnimatedDoFadeInState();
}

class _AnimatedDoFadeInState extends State<AnimatedDoFadeIn> {
  bool animatePlayIn = false;
  bool animatePlayInDown = false;
  bool animatePlayInDownBig = false;
  bool animatePlayInLeft = false;
  bool animatePlayInLeftBig = false;
  bool animatePlayInRight = false;
  bool animatePlayInRightBig = false;
  bool animatePlayInUp = false;
  bool animatePlayInUpBig = false;
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
                      animatePlayIn = true;
                      animatePlayInDown = true;
                      animatePlayInDownBig = true;
                      animatePlayInLeft = true;
                      animatePlayInLeftBig = true;
                      animatePlayInRight = true;
                      animatePlayInRightBig = true;
                      animatePlayInUp = true;
                      animatePlayInUpBig = true;
                    }),
                icon: const Icon(Icons.play_arrow),
                label: const Text("sds")),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeIn(child: _content(), animate: animatePlayIn),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInDown = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInDown(child: _content(), animate: animatePlayInDown),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInDownBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInDownBig(child: _content(), animate: animatePlayInDownBig),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInLeft = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInDownBig(child: _content(), animate: animatePlayInLeft),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInLeftBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInLeftBig(child: _content(), animate: animatePlayInLeftBig),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInRight = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInRight(child: _content(), animate: animatePlayInRight),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInRightBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInRightBig(child: _content(), animate: animatePlayInRightBig),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInUp = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInUp(child: _content(), animate: animatePlayInUp),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInUpBig = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                FadeInUpBig(child: _content(), animate: animatePlayInUpBig),
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
