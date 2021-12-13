import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Add new activity',
          ),
        ),
      ),
    );
  }
}
