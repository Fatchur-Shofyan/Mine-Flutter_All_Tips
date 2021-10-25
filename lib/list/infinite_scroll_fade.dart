import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/Utils/Animation/fade.dart';
import 'package:learn/Utils/design.dart';
import 'package:learn/models/job.dart';

class InfinateScrollFadePage extends StatelessWidget {
  const InfinateScrollFadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Design.whiteSemi,
      appBar: AppBar(
        backgroundColor: Design.redDarkColor,
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
  // List<String> items = [];
  bool loading = false, allLoaded = false;

  List<dynamic> jobList = [];

  int count = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/jobs.json');
    final data = await json.decode(response);

    setState(() {
      jobList = data['jobs'].map((data) => Job.fromJson(data)).toList();
    });
    mockFetch();
  }

  mockFetch() async {
    if (allLoaded) return;
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(milliseconds: 500));

    List<dynamic> newData = [];
    if (jobList.length <= 200) {
      final String response = await rootBundle.loadString('assets/json/jobs.json');
      final data = await json.decode(response);
      newData = data['jobs'].map((data) => Job.fromJson(data)).toList();
      if (newData.isNotEmpty) {
        jobList.addAll(newData);
      }
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
      if ((_scrollController.position.pixels - 5) >= _scrollController.position.maxScrollExtent && !loading) {
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
      if (jobList.isNotEmpty) {
        return Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(20),
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                return AnimationFade(
                  begin: const Offset(0, -0.5),
                  end: Offset.zero,
                  duration: 1500,
                  delay: ((1 + index) / jobList.length) / 2,
                  child: jobComponent(job: jobList[index]),
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

  jobComponent({required Job job}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(job.companyLogo),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(job.title, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 5),
                        Text(job.address, style: TextStyle(color: Colors.grey[500])),
                      ]),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    job.isMyFav = !job.isMyFav;
                  });
                },
                child: AnimatedContainer(
                  height: 35,
                  padding: const EdgeInsets.all(5),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: job.isMyFav ? Colors.red.shade100 : Colors.grey.shade300,
                    ),
                  ),
                  child: Center(
                    child: job.isMyFav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.grey.shade600,
                          ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
                    child: Text(
                      job.type,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(int.parse("0xff${job.experienceLevelColor}")).withAlpha(20)),
                    child: Text(
                      job.experienceLevel,
                      style: TextStyle(color: Color(int.parse("0xff${job.experienceLevelColor}"))),
                    ),
                  )
                ],
              ),
              Text(
                job.timeAgo,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
