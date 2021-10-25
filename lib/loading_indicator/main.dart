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

  _showSingleAnimationDialog(BuildContext context, Indicator indicator, bool showPathBackground) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: false,
        builder: (ctx) {
          return Scaffold(
            appBar: AppBar(
              title: Text(indicator.toString().split('.').last),
            ),
            body: Padding(
              padding: const EdgeInsets.all(64),
              child: Center(
                child: LoadingIndicator(
                  indicatorType: indicator,
                  colors: _kDefaultRainbowColors,
                  strokeWidth: 4.0,
                  pathBackgroundColor: showPathBackground ? Colors.black45 : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.grid_on),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => GridWidget(),
                ),
              );
            }),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () => _showSingleAnimationDialog(
                ctx,
                Indicator.values[index],
                false,
              ),
              onLongPress: () => _showSingleAnimationDialog(
                ctx,
                Indicator.values[index],
                true,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Text(
                  Indicator.values[index].toString().split('.').last,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            );
          },
          itemCount: Indicator.values.length,
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