//import flutter helper library
import 'dart:convert';

import 'package:first_flutter_app/src/models/image_model.dart';
import 'widgets/image_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
//Create class that will be our custom widget
//This class must extend the 'StatelessWidget' base class
class App extends StatefulWidget{
  createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);  
    });

  }

  //Define a 'build' method that returns the widgets that *this* widget will show.
  Widget build(context){
    return MaterialApp(
    // home: Text('Hello World'),
    home: Scaffold(
      body: ImageList(images),
      appBar: AppBar(
        title: Text("Let's see some images."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchImage,
        child: Icon(Icons.add),
        backgroundColor: Colors.purpleAccent,),
      ),
    );
  }
}
