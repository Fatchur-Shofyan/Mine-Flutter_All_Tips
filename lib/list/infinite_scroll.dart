import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfinateScrollPage extends StatelessWidget {
  const InfinateScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        elevation: 0.0,
        title: const Text('Marketing'),
      ),
      body: const TripBodyPage(),
    );
  }
}

class TripBodyPage extends StatefulWidget {
  const TripBodyPage({Key? key}) : super(key: key);

  @override
  _TripBodyPageState createState() => _TripBodyPageState();
}

class _TripBodyPageState extends State<TripBodyPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = [];
  bool loading = false, allLoaded = false;

  mockFetch() async {
    if (allLoaded) return;
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    List<String> newData = items.length >= 60 ? [] : List.generate(20, (index) => "List item ${index + items.length}");
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }
    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent && !loading) {
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (items.isNotEmpty) {
        return Stack(
          children: [
            ListView.separated(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  debugPrint("$index - ${items.length}");
                  if (index < items.length) {
                    return ListTile(title: Text(items[index]));
                  } else {
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: 50,
                      child: const Center(
                        child: Text("Nothing more to Load"),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, constraints) {
                  return const Divider(height: 1);
                },
                itemCount: items.length + (allLoaded ? 1 : 0)),
            if (loading)
              Positioned(
                left: 0,
                bottom: 100,
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: 80,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
          ],
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
