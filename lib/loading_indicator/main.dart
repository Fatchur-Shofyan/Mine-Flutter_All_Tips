import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

const List<Color> _kDefaultRainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class LoadingIndicatorPage extends StatelessWidget {
  const LoadingIndicatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (ctx, index) => Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: LoadingIndicator(
                        indicatorType: Indicator.values[index],
                        colors: _kDefaultRainbowColors,
                        strokeWidth: 4.0,
                        pathBackgroundColor: Colors.black45,
                        // pathBackgroundColor: Colors.black45,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
                childCount: Indicator.values.length,
              ),
            ),
          ],
        ),
      );
}

class GridWidget extends StatelessWidget {
  const GridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Grid Demo'),
            floating: true,
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            delegate: SliverChildBuilderDelegate(
              (ctx, index) => Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: LoadingIndicator(
                      indicatorType: Indicator.values[index],
                      colors: _kDefaultRainbowColors,
                      strokeWidth: 4.0,
                      pathBackgroundColor: Colors.black45,
                      // pathBackgroundColor: Colors.black45,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              childCount: Indicator.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
