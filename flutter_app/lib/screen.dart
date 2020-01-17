import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<String> items = ["title 1", "title 2"];
  String val = "";

  List<Widget> listItems() {
    List<Widget> temp = [
      TextField(
        onChanged: (String newText) {
          val = newText;
        },
      ),
    ];
    for (int i = 0; i < items.length; i++) {
      temp.add(
        ListTile(
          title: Text(items[i]),
          subtitle: Text("subtitle"),
        ),
      );
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: listItems(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items.add(val);
          });
        },
        child: Text("Add"),
      ),
    );
  }
}
