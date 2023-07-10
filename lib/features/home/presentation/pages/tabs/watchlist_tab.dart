import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WatchList"),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
