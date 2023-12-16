import 'package:dictionary_app/Words.dart';
import 'package:flutter/material.dart';

class Detail_page extends StatefulWidget {
  Words word;

  Detail_page({required this.word});

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Detail Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.word.ingilizce,
              style: TextStyle(fontSize: 20),
            ),
            Divider(), // Add a Divider widget here
            Text(
              widget.word.turkce,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}