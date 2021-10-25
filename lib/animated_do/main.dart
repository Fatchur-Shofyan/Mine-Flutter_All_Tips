import 'package:flutter/material.dart';
import 'package:learn/animated_do/animated_do_bounce_in.dart';
import 'package:learn/animated_do/animated_do_elastic_in.dart';
import 'package:learn/animated_do/animated_do_fade_in.dart';
import 'package:learn/animated_do/animated_do_fade_out.dart';
import 'package:learn/animated_do/animated_do_flip_in.dart';
import 'package:learn/animated_do/animated_do_slide_in.dart';
import 'package:learn/animated_do/animated_do_special_in.dart';
import 'package:learn/animated_do/animated_do_zoom.dart';

class AnimtedDo extends StatefulWidget {
  const AnimtedDo({Key? key}) : super(key: key);

  @override
  _AnimtedDoState createState() => _AnimtedDoState();
}

class _AnimtedDoState extends State<AnimtedDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Do'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Fade In'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoFadeIn()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Fade Out'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoFadeOut()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('BounceIn'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoBounceIn()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('ElasticIn'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoElasticIn()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('SlideIns'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoSlideIn()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('FlipIn'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoFlipIn()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Zooms'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoZooms()),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('SpecialIn Animations'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnimatedDoSpecialIn()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
