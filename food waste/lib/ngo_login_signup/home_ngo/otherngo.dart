import 'package:flutter/material.dart';

import '../../constants/constant.dart';
class otherngo extends StatefulWidget {
  const otherngo({Key? key}) : super(key: key);

  @override
  State<otherngo> createState() => _otherngoState();
}

class _otherngoState extends State<otherngo> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Pending'),
    Tab(text: 'Accept'),
    Tab(text: 'Previous'),
  ];
  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          children: myTabs.map((Tab tab) {
            //final String label = tab.text;
            return Center(
              child: Text(
                'This is the  tab',
                style: const TextStyle(fontSize: 36),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
