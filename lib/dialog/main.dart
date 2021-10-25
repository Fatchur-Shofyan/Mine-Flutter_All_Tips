// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:learn/dialog/awesome_dialog.dart';
import 'package:learn/dialog/material_dialog.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Awesome Dialog'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DialogAwesomeDialog()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Material Dialog'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DialogMaterialDialog()),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
