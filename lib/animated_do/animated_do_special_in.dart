import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedDoSpecialIn extends StatefulWidget {
  const AnimatedDoSpecialIn({Key? key}) : super(key: key);

  @override
  _AnimatedDoSpecialInState createState() => _AnimatedDoSpecialInState();
}

class _AnimatedDoSpecialInState extends State<AnimatedDoSpecialIn> {
  bool animatePlayInDown = false;
  bool animatePlayIn1 = false;
  bool animatePlayIn2 = false;
  bool animatePlayIn3 = false;
  bool animatePlayIn4 = false;
  bool animatePlayIn5 = false;
  bool animatePlayIn6 = false;
  bool animatePlayIn7 = false;
  bool animatePlayIn8 = false;
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
                      animatePlayInDown = true;
                      animatePlayIn1 = true;
                      animatePlayIn2 = true;
                      animatePlayIn3 = true;
                      animatePlayIn4 = true;
                      animatePlayIn5 = true;
                      animatePlayIn6 = true;
                      animatePlayIn7 = true;
                      animatePlayIn8 = true;
                    }),
                icon: const Icon(Icons.play_arrow),
                label: const Text("sds")),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayInDown = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                JelloIn(child: _content(), animate: animatePlayInDown),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn1 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Bounce(child: _content(), animate: animatePlayIn1, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn2 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Flash(child: _content(), animate: animatePlayIn2, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn3 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Pulse(child: _content(), animate: animatePlayIn3, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn4 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Swing(child: _content(), animate: animatePlayIn4, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn5 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Spin(child: _content(), animate: animatePlayIn5, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn6 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                SpinPerfect(child: _content(), animate: animatePlayIn6, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn7 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Dance(child: _content(), animate: animatePlayIn7, infinite: true),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () => setState(() {
                    animatePlayIn8 = true;
                  }),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Play"),
                ),
                Roulette(child: _content(), animate: animatePlayIn8, infinite: true),
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
