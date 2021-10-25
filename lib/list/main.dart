// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';

import 'package:learn/list/fade_list.dart';
import 'package:learn/list/infinite_scroll.dart';
import 'package:learn/list/infinite_scroll_fade.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Infinate Scroll'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InfinateScrollPage()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('List with fade animation'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ListFadePage()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Infinate Scroll with Fade Animation'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const InfinateScrollFadePage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
