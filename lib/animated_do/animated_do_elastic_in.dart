import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AnimatedDoElasticIn extends StatefulWidget {
  const AnimatedDoElasticIn({Key? key}) : super(key: key);

  @override
  _AnimatedDoElasticInState createState() => _AnimatedDoElasticInState();
}

class _AnimatedDoElasticInState extends State<AnimatedDoElasticIn> {
  bool animatePlayInDown = false;
  bool animatePlayInLeft = false;
  bool animatePlayInRight = false;
  bool animatePlayInUp = false;
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
                      animatePlayInLeft = true;
                      animatePlayInRight = true;
                      animatePlayInUp = true;
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
                ElasticInDown(child: _content(), animate: animatePlayInDown),
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
                ElasticInLeft(child: _content(), animate: animatePlayInLeft),
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
                ElasticInRight(child: _content(), animate: animatePlayInRight),
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
                ElasticInUp(child: _content(), animate: animatePlayInUp),
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
