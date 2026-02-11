import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Feed Timeline'),
      ),
      body: ListView(
        children: List.generate(20, (index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[ 
                Image.network('https://via.placeholder.com/350'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Video Title $index'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Video Description goes here. This is a sample description for video $index.'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}