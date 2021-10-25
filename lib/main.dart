import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn/Utils/Animation/fade.dart';
import 'package:learn/animated_do/main.dart';
import 'package:learn/calendar/main.dart';
import 'package:learn/connectivity/main.dart';
import 'package:learn/dialog/main.dart';
import 'package:learn/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/list/main.dart';
import 'package:learn/loading_indicator/main.dart';
import 'package:learn/location/geolocator.dart';
import 'package:learn/models/menu.dart';
import 'package:learn/progress_timeline/main.dart';
import 'package:learn/shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('es', ''),
        ],
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter Demo Home Page"),
          ),
          body: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  // List<String> items = [];
  bool loading = false, allLoaded = false;

  List<dynamic> jobList = [];

  int count = 0;

  List menu = [
    {"title": 'Dialog', "page": const MyDialog()},
    {"title": 'Calendar', "page": const MyCalendar()},
    {"title": 'Location', "page": const GeolocatorWidget()},
    {"title": 'List', "page": const ListPage()},
    {"title": 'Progress Timeline', "page": const ProgressTimelinePage()},
    {"title": 'Shimmer', "page": const ShimmerPage()},
    {"title": 'Animated Do', "page": const AnimtedDo()},
    {"title": 'Connectivity', "page": const ConnectivityPage()},
    {"title": 'Loading Indicator', "page": const LoadingIndicatorPage()},
  ];
  mockFetch() async {
    if (allLoaded) return;
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));

    List<dynamic> newData = [];
    // if (jobList.length <= 200) {
    newData = menu.map((data) => Menu.fromJson(data)).toList();
    if (newData.isNotEmpty) {
      jobList.addAll(newData);
    }
    // }

    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    mockFetch();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (jobList.isNotEmpty) {
        return Stack(
          children: [
            GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                return AnimationFade(
                  begin: const Offset(0, -0.5),
                  end: Offset.zero,
                  duration: 1500,
                  delay: ((1 + index) / jobList.length) / 2,
                  // child: Text("sds"),
                  child: jobComponent(menu: jobList[index]),
                );
              },
            ),
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

  jobComponent({required Menu menu}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => menu.page));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15, right: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ]),
        child: Center(
          child: Text(menu.title),
        ),
      ),
    );
  }
}
