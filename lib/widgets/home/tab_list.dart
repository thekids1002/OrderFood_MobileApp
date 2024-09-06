import 'package:flutter/material.dart';
import 'package:orderfood1/widgets/home/tab_item.dart';

class TabList extends StatefulWidget {
  const TabList({super.key});

  @override
  State<TabList> createState() => _TabListState();
}

class _TabListState extends State<TabList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        TabItem(),
        TabItem(),
        TabItem(),
        TabItem(),
      ],
    );
  }
}
