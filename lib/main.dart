import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learn/animated_do/main.dart';
import 'package:learn/calendar/main.dart';
import 'package:learn/dialog/awesome_dialog.dart';
import 'package:learn/dialog/material_dialog.dart';
import 'package:learn/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/list/main.dart';
import 'package:learn/location/geolocator.dart';
import 'package:learn/location/geolocator2.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BuildButton(
              text: 'Awesome Dialog',
              onPressed: const DialogAwesomeDialog(),
            ),
            BuildButton(
              text: 'Material Dialog',
              onPressed: DialogMaterialDialog(),
            ),
            BuildButton(
              text: 'Calendar',
              onPressed: const MyCalendar(),
            ),
            BuildButton(
              text: 'Location',
              onPressed: const GeolocatorWidget(),
            ),
            BuildButton(
              text: 'List',
              onPressed: const ListPage(),
            ),
            BuildButton(
              text: 'Progress Timeline',
              onPressed: const ProgressTimelinePage(),
            ),
            BuildButton(
              text: 'Shimmer',
              onPressed: const ShimmerPage(),
            ),
            BuildButton(
              text: 'Animated Do',
              onPressed: const AnimtedDo(),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BuildButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var onPressed;
  final String text;
  BuildButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text, style: const TextStyle(color: Colors.white)),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => onPressed));
      },
    );
  }
}
