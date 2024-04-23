import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Design Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('UI Design Example'),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 50,
                  color: Colors.blue,
                  child: Center(
                    child: Text('Header'),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text('Widget 1'),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      child: Center(
                        child: Text('Widget 2'),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                      child: Center(
                        child: Text('Widget 3'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                ),
                SizedBox(height: 5),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 3,
                  crossAxisCount: 3,
                  children: List.generate(
                    3,
                    (index) {
                      return Container(
                          color: Colors.orange,
                          child: Center(child: Text('Grid Item $index')));
                    },
                  ),
                ),
                SizedBox(height: 10),
                Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      TableCell(child: Center(child: Text('Row1, Cell1'))),
                      TableCell(child: Center(child: Text('Row1, Cell2'))),
                    ]),
                    TableRow(children: [
                      TableCell(child: Center(child: Text('Row2, Cell1'))),
                      TableCell(child: Center(child: Text('Row2, Cell2'))),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }}
