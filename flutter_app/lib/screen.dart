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

  void _addNewTransaction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Add Item',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
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
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.blue[50],
                      textColor: Colors.blue[900],
                      child: Text('Cancel'),
                      onPressed: () {
                        setState(
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FlatButton(
                      child: Text('Add'),
                      color: Colors.blue[50],
                      textColor: Colors.blue[900],
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
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item['title']),
              onDismissed: (_) {
                items.removeAt(index);
              },
              child: ListTile(
                title: Text(items[index]['title']),
                subtitle: Text(items[index]['subtitle']),
              ),
              background: Container(color: Colors.red),
            );
          },
          itemCount: items.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTransaction,
        child: Text("Add"),
      ),
    );
  }
}
