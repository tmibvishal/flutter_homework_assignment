import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Map<String, String>> items = [
    {
      'title': 'title1',
      'subtitle': 'subtitle1',
    },
  ];
  String val = "";
  String subtitle = '';

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
          title: Text(items[i]['title']),
          subtitle: Text(items[i]['subtitle']),
        ),
      );
    }
    return temp;
  }

  void _addNewTransaction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Item'),
            elevation: 5,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Title',
                  ),
                  onChanged: (String text) {
                    val = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Subtitle',
                  ),
                  onChanged: (String text) {
                    subtitle = text;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('cancel'),
                      onPressed: () {
                        setState(
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                    RaisedButton(
                      child: Text('Add'),
                      onPressed: () {
                        setState(() {
                          items.add({
                            'title': val,
                            'subtitle': subtitle,
                          });
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
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
        onPressed: _addNewTransaction,
        child: Text("Add"),
      ),
    );
  }
}
