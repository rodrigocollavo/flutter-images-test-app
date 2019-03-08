import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('calling createState method');
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  AppState() {
    print('constructor');
  }

  void fetchImage() async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/${counter}');
    print(response.body);
    var image = ImageModel.fromJson(json.decode(response.body));
    this.setState(() {
      images.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('calling build method');
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text("Load Images!"),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
      ),);
  }

}